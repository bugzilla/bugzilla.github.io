#!/usr/bin/perl -w

use strict;
use warnings;
use CGI::Util; # For simple_escape
use File::Basename qw(dirname);
use File::Path qw(mkpath);
use Getopt::Long;
use IO::File;
use Template;
use LWP::UserAgent;

die "You must be in the root of a bugzilla.org checkout\n"
    unless (-d 'src' && -d 'lib' && -d 'bin');

use lib 'lib/perl';
use BugzillaOrg::Util;

$Template::Config::SERVICE = 'BugzillaOrg::Template::Service';

use constant TEMPLATE_CONFIG => {
    INCLUDE_PATH => ['lib/release-template'],

    FILTERS => {
        branch => \&branch,
    },

};

our ($template, $ua, %switch);

#######################
# Utility subroutines #
#######################

sub write_template {
    my ($filename, $template_file, $vars) = @_;

    my $dir = dirname($filename);
    if (!-d $dir) {
        print "Creating $dir...\n";
        mkpath($dir);
    }

    print "Creating $filename...\n";
    my $fh = new IO::File($filename, '>') 
        or die "Can't create $filename: $!";
    $template->process($template_file, { %switch, %$vars }, $fh)
        or die $template->error;
    $fh->close();
}

sub get_template {
    my ($template_file, $vars) = @_;
    my $output;
    $template->process($template_file, { %switch, %$vars }, \$output);
    return $output;
}

###############################
# Subroutines to create files #
###############################

sub release_index {
    my ($version) = @_;
    my $filename = "src/releases/$version/index.html";
    write_template($filename, 'releases/index.html', { version => $version });
}

sub release_notes {
    my ($version) = @_;

    # Get web release notes for 3.0 or higher.
    my $install = branch($version) . '-branch';
    $version =~ /^(\d+)/;
    my $major = $1;
    my $page = 'page.cgi?id=release-notes.html';
    # Major versions before 3.0 use text release notes.
    if ($major < 3) {
        $page = 'docs/rel_notes.txt';
    }
    my $url = "https://landfill.bugzilla.org/bugzilla-$install/$page";
    print "Getting release notes from $url...\n";
    my $response = $ua->get($url);
    my $relnotes = $response->content;
    if ($major < 3) {
        $relnotes = CGI::Util::simple_escape($relnotes);
        $relnotes = "<pre>$relnotes</pre>";
    }
    else {
        $relnotes =~ s/^.+?\Q<div id="bugzilla-body">\E//s;
        $relnotes =~ s/<\/div>\s+<div id="footer">.+$//s;
        $relnotes =~ s/page\.cgi\?id=release-notes\d?.html/\.\.\/index\.html/;
        $relnotes =~ s/"(page\.cgi\?id=(fields|quicksearch)\.html)"/"https:\/\/landfill\.bugzilla\.org\/bugzilla-$install\/$1"/g;
    }
    # Escape % signs so that Template Toolkit doesn't get confused.
    $relnotes =~ s/%/&#37;/g;

    my $filename = "src/releases/$version/release-notes.html";
    write_template($filename, 'releases/release-notes.html',
        { version => $version, relnotes => $relnotes });
}    

sub security_advisory {
    my ($security, $versions) = @_;
    my @previous;
    foreach my $ver (@$versions) {
        if ($ver =~ /^(\d+\.\d+)\.(\d+)$/) {
            my ($main, $micro) = ($1, $2);
            $micro = $micro - 1;
            push(@previous, "$main.$micro");
        }
        else {
            push(@previous, "$ver-FIXME-VERSION");
        }
    }

    write_template("src/security/$security/index.html", 'security/index.html',
                   { previous => \@previous });
}

sub news {
    my ($info) = @_;
    my @stable_releases = @{ $info->{'stable'} || [] };
 
    my $stable = shift @stable_releases;

    my $news = get_template('news/index.html',
        { versions => $info->{versions}, 
          old      => \@stable_releases,
          stable   => $stable, 
          devel    => $info->{dev}, 
          rc       => $info->{rc} });

    my $template_file = 'src/news/index.html';
    print "Updating $template_file...\n";
    system("git reset --hard $template_file");
    my $news_fh = new IO::File($template_file, '<');
    my $news_text;
    { local $/; $news_text = <$news_fh>; }
    $news_fh->close();
    my $top_marker = "<h1>Current News</h1>";
    $news_text =~ s/\Q$top_marker\E/$top_marker\n$news/;
    $news_fh = new IO::File($template_file, '>');
    print $news_fh $news_text;
    $news_fh->close();
}

###############
# Main Script #
###############

GetOptions(\%switch, 'help|h|?', 'security=s', 'relnotes-only');

$template = Template->new(TEMPLATE_CONFIG)
  || die("Template creation failed: " . Template->error());
$ua = new LWP::UserAgent;

my $vers = get_versions(@ARGV);
my @versions = @{ $vers->{'versions'} };
my @stable = @{ $vers->{'stable'} };
my $rc = $vers->{'rc'};
my $dev = $vers->{'dev'};
print "Security Advisory: " . $switch{'security'} . "\n" if $switch{'security'};

foreach my $version (@stable) {
    release_notes($version);
    next if $switch{'relnotes-only'};
    release_index($version);
    print "** Remember to update lib/releases-list.txt\n";
}

exit if $switch{'relnotes-only'};

if ($rc) {
    my $branch = branch($rc);
    print "** Remember to update src/releases/$branch/index.html\n";
    release_notes($branch);
}

if ($dev) {
    my $dev_branch = branch($dev);
    print "** Remember to update src/releases/$dev_branch/index.html\n";
}

if ($switch{'security'}) {
    security_advisory($switch{'security'}, \@versions);
    print "** Remember to update src/security/index.html\n";
}

if (scalar @versions) {
    news($vers);
    print "** Remember to update src/index.html\n";
    print "** Remember to update src/download/index.html\n";
    print "** Remember to update src/docs/index.html\n";
    print "** Remember to update src/status/changes.html\n";
}
