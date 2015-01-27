#!/usr/bin/perl -w

use strict;
use warnings;
use Data::Dumper;
use File::Path qw(mkpath rmtree);
use Getopt::Long;
use IO::File;

die "You must be in the root of a bugzilla.org checkout\n"
    unless (-d 'src' && -d 'lib' && -d 'bin');

use lib 'lib/perl';
use BugzillaOrg::Util;

use constant TAG_DIR => 'bugzilla/tag';

our (%switch, %branches);

#######################
# Utility Subroutines #
#######################

sub do_command {
    my ($command) = @_;
    print "$command\n";
    system($command);
}

sub cvs_up {
    my ($tag) = @_;
    do_command("cvs -Q up -dP -r $tag");
}
sub tag_remove {
    my ($tag) = @_;
    cvs_up($tag);
    my $n = $switch{'dry-run'} ? "-n" : "";
    do_command("cvs -Q $n tag -R -d $tag");
    print "Removed the $tag tag\n";
}

sub branch_is_taggable {
    my $constants_fh = new IO::File('Bugzilla/Constants.pm', '<');
    my @contents = <$constants_fh>;
    $constants_fh->close();
    if (grep(/^use constant BUGZILLA_VERSION => "\d+\.\d+(\.\d+|rc\d)?";$/, @contents))
    {
        return 1;
    }
    return 0;
}

#######################
# Tagging Subroutines #
#######################

sub checkout_version {
    my ($version, $as) = @_;
    chdir TAG_DIR;
    my $branch = $branches{branch($version)} || $switch{'branch'} || 'HEAD';
    do_command("cvs -Q -d $as\@cvs.mozilla.org:/cvsroot"
               . " co -P -d $branch -r $branch Bugzilla");
    chdir "../..";
    return $branch;
}

sub tag {
    my ($branch, $tag, $move) = @_;
    chdir TAG_DIR . "/$branch";
    if (!branch_is_taggable()) {
        warn "$branch does not have a stable BUGZILLA_VERSION.\n";
        chdir "../../..";
        return;
    }
    tag_remove($tag, $branch) if $move;
    cvs_up($branch);
    my $n = $switch{'dry-run'} ? "-n" : "";
    do_command("cvs -Q $n tag -FR $tag");
    print "Added the tag $tag to $branch\n";
    chdir "../../..";
}

###############
# Main Script #
###############

GetOptions(\%switch, 'help|h|?', 'as=s', 'dry-run|n', 'branch=s');

my $vers = get_versions(@ARGV);
my @versions = @{ $vers->{'versions'} };
my @stable = @{ $vers->{'stable'} };
my $as = $switch{'as'} || 'dlawrence%mozilla.com';

print "\nTagging Releases...\n";

my $config = "etc/docs-versions";
require $config;

mkpath(TAG_DIR) if !-d TAG_DIR;

my $major_stable = $stable[0];
my %created_tags;
foreach my $version (@versions) {
    my $branch = checkout_version($version, $as);
    print "Checked out $branch for $version.\n\n";
    my $tag_version = $version;
    $tag_version =~ s/\./_/g;
    my $version_tag = "BUGZILLA-$tag_version";
    tag($branch, $version_tag, 0);
    $created_tags{$version} = [$version_tag];
    if (is_stable($version)) {
        my $version_branch = branch($version);
        $version_branch =~ s/\./_/;
        my $branch_stable_tag = "BUGZILLA-$version_branch-STABLE";
        tag($branch, $branch_stable_tag, 1);
        push(@{ $created_tags{$version} }, $branch_stable_tag);
    }
    if ($version eq $major_stable) {
        tag($branch, 'Bugzilla_Stable', 1);
        push(@{ $created_tags{$version} }, 'Bugzilla_Stable');
    }
}

rmtree(TAG_DIR);

print "Created Tags:\n";
print Dumper(\%created_tags);
