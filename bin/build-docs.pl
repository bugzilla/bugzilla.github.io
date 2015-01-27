#!/usr/bin/perl -w
#
# This file is covered by the same license as the web site.

use strict;
use warnings;

use File::Basename;
use Getopt::Long;

my $force = 0;
my $verbose = 0;
GetOptions('force' => \$force,
           'verbose|v+' => \$verbose);

use lib qw(.);
use vars qw( %branches );
my $config = dirname($0) . "/../etc/docs-versions";
do $config || die "couldn't load $config: $!";

die "No docs branches defined" if !(keys %branches);

# We want to make sure we're in the base directory.
chdir(dirname($0) . '/..');
mkdir 'bugzilla' unless -d 'bugzilla';
chdir 'bugzilla';

# Update the base clone we make our new copies from, when needed. We do this
# for speed. We could make the different versions checkouts of this rather than
# copies, but then we have to set up tracking branches, and it's all a bit
# fiddly.
if (!-d "base-clone") {
    print "Cloning new base clone...\n" if $verbose;
    system("git clone https://git.mozilla.org/bugzilla/bugzilla base-clone");
}
else {
    print "Updating base clone...\n" if $verbose;
    chdir 'base-clone';
    system("git fetch");
    chdir '..';
}

# Build docs for git repos
foreach my $version (keys %branches) {
    print "Checking out Bugzilla $version...\n" if $verbose;
    
    if (-d "$version" && ($force || -e "$version/CVS" || -e "$version/.bzr" || -e "$version/.git")) {
        print "Blowing away old checkout...\n" if $verbose;
        system("/bin/rm", "-rf", "$version");
    }
    
    my $build_needed = 0;
    if (!-d $version) {
        print "No checkout - copying a new one...\n" if $verbose;
        system("cp -rp base-clone $version");
        $build_needed = 1;
    }
    
    print "Updating checkout...\n" if $verbose;
    chdir $version;
    system("git checkout -q " . $branches{$version});
    my $output = `git pull 2>&1 | grep -E '^Already up-to-date'`;
    if (!$output) {
        print "Build required...\n" if $verbose;
        $build_needed = 1;
    }
    
    chdir '..';

    if ($build_needed || $force) {
        if (-d "$version/docs/en/xml") {
            print "Building all docs...\n" if $verbose;
            build_all_docs($version);
        }
        else {
            # If we have moved to reST docs, only build the POD
            print "Building only POD...\n" if $verbose;
            build_pod_docs($version);
        }
    }
    
    print "Finished Bugzilla $version.\n" if $verbose;
}

sub build_all_docs {
    my $version = shift;

    chdir $version;
    print "Building docs for Bugzilla $version...\n" if $verbose;
    system("$^X -w docs/makedocs.pl --with-pdf > /dev/null");
    
    my $docs_dir =  "../../dest/docs/$version";
    mkdir $docs_dir unless -d $docs_dir;
    my @docdirs;
    my $docs_base = "docs";
    
    if (-e "$docs_base/style.css") {
        system("/bin/cp","$docs_base/style.css","$docs_dir/");
    }
    
    if (-d "$docs_base/xml") {
        push(@docdirs, "$docs_base");
    }
    
    # search for sub directories which have an 'xml' sub-directory
    opendir(LANGS, "$docs_base/");
    foreach my $dir (readdir(LANGS)) {
        next if (($dir eq '.') || ($dir eq '..') || (! -d "$docs_base/$dir"));
        if (-d "$docs_base/$dir/xml") {
            push(@docdirs, "$docs_base/$dir");
        }
    }
    closedir(LANGS);

    foreach my $docdir (@docdirs) {
        print "Importing finished docs for Bugzilla $version ($docdir)...\n" if $verbose;
        my $dst_dir = "$docs_dir";
        if ($docdir =~ m#docs/(\S+)#) { $dst_dir .= "/$1" }
        foreach my $type (qw(html txt pdf xml images)) {
            my $src_dir = "$docdir/$type";
            next unless -d $src_dir;
            my $verbose_arg = $verbose ? "-v" : "";
            system("rsync --delete $verbose_arg -rt $src_dir $dst_dir");
        }
    }
    chdir '..';
}

sub build_pod_docs {
    my $version = shift;

    chdir $version;
    print "Building POD docs for Bugzilla $version...\n" if $verbose;
    system("$^X -w docs/makedocs.pl --pod-only > /dev/null");

    my $src_dir = "docs/en/html";
    next unless -d $src_dir;
    
    my $dest_dir =  "../../dest/docs/$version";
    mkdir $dest_dir unless -d $dest_dir;
    
    print "Importing finished POD docs for Bugzilla $version...\n" if $verbose;

    if (-e "docs/style.css") {
        system("/bin/cp", "docs/style.css", "$dest_dir/");
    }

    my $verbose_arg = $verbose ? "-v" : "";
    system("rsync --delete $verbose_arg -rt $src_dir $dest_dir/en");

    chdir '..';
}
