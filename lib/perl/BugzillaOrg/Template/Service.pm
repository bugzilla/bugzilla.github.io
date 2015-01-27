# We are a Template Toolkit Service that creates valid Template Toolkit
# templates. We convert {% and %} to [% and %].
package BugzillaOrg::Template::Service;
use strict;
use base qw(Template::Service);

sub process {
    my $self = shift;
    my $output = $self->SUPER::process(@_);
    $output =~ s/{%/[%/g;
    $output =~ s/%}/%]/g;
    return $output;
}

1;
