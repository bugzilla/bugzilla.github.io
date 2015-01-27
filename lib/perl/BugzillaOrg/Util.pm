package BugzillaOrg::Util;
use strict;
use base qw(Exporter);

use Sort::Versions;

our @EXPORT = qw(
    branch
    get_versions
    is_rc
    is_stable
);

sub branch {
    my ($version) = @_;
    $version =~ /^((\d+)\.(\d+))/;
    my ($branch, $major, $minor) = ($1, $2, $3);
    # Odd numbers get made even
    if ($minor % 2) {
        $minor = $minor + 1;
        $branch = "$major.$minor";
     }
     return $branch;
}

sub is_stable {
    my ($version) = @_;
    $version =~ /^\d+\.(\d+)/;
    # Only even numbers are stable
    my $is_stable = ($1 % 2) ?  0 : 1;
    return ($is_stable && !is_rc($version)) ? 1 : 0;
}

sub is_rc { return $_[0] =~ /rc/ ? 1 : 0 };

sub get_versions {
    my @versions = @_;

    my ($rc) = grep { is_rc($_) } @versions;
    my ($dev_release) = grep { !is_stable($_) && !is_rc($_) } @versions;
    my @stable_releases = grep { is_stable($_) } @versions;
    @stable_releases = reverse sort versioncmp @stable_releases;

    print "Dev Release: $dev_release\n" if $dev_release;
    print "Stable Releases: " . join(', ', @stable_releases) . "\n";
    return { dev => $dev_release, stable => \@stable_releases,
             rc => $rc, versions => \@versions };
}

1;
