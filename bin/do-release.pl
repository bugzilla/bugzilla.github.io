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

die "You must be in the root of a bugzilla.github.io checkout\n"
    unless (-d '_layouts' && -d 'img' && -d '_release-template');

use lib 'lib/perl';
use BugzillaOrg::Util;

$Template::Config::SERVICE = 'BugzillaOrg::Template::Service';

use constant TEMPLATE_CONFIG => {
    INCLUDE_PATH => ['_release-template'],

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
    my $filename = "releases/$version/index.html";
    write_template($filename, 'releases/index.html', { version => $version });
}

sub release_notes {
    my ($version) = @_;

    # Get release notes from repo
    my $install = branch($version) . '-branch';
    $version =~ /^(\d+)/;
    my $major = $1;
    my $page = 'template/en/default/pages/release-notes.html.tmpl';
    my $url = "https://raw.githubusercontent.com/bugzilla/bugzilla/$version/$page";
    print "Getting release notes from $url...\n";
    my $response = $ua->get($url);
    my $relnotes = $response->content;

    # Chop off header and footer
    $relnotes =~ s/^.+?\Q</h1>\E//s;
    $relnotes =~ s/\Q[% INCLUDE global/footer.html.tmpl %]\E.+$//s;
    
    # Poor man's noun replacement system
    $relnotes =~ s/\Q[% terms.bug %]\E/bug/g;
    $relnotes =~ s/\Q[% terms.Bug %]\E/Bug/g;
    $relnotes =~ s/\Q[% terms.Bugzilla %]\E/Bugzilla/g;

    # Remove templated "minimum version" stuff that isn't processed in the raw
    # file
    $relnotes =~ s/\Q<h2 id="req">\E.+(<h2 id="feat">)/$1/s;

    # Escape any % signs so that Template Toolkit doesn't get confused.
    $relnotes =~ s/%/&#37;/g;

    my $filename = "releases/$version/release-notes.html";
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

    write_template("security/$security/index.html", 'security/index.html',
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

    my $template_file = 'news/index.html';
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
    print "** Remember to update _data/releases-list.csv\n";
}

exit if $switch{'relnotes-only'};

if ($rc) {
    my $branch = branch($rc);
    print "** Remember to update releases/$branch/index.html\n";
    release_notes($branch);
}

if ($dev) {
    my $dev_branch = branch($dev);
    print "** Remember to update releases/$dev_branch/index.html\n";
}

if ($switch{'security'}) {
    security_advisory($switch{'security'}, \@versions);
    print "** Remember to update security/index.html\n";
}

if (scalar @versions) {
    news($vers);
    print "** Remember to update index.html\n";
    print "** Remember to update download/index.html\n";
    print "** Remember to update docs/index.html\n";
}
