# -*- Mode: perl; indent-tabs-mode: nil -*-

package MozillaOrg::Template::Plugin::MetaExtractor;

# Output Data Format:
#
# document
#   .doctype
#   .head
#   .content
#   .title
#   .lang (ISO lang code)
#   .dir (ltr|rtl)
#   .format (html|xhtml)
#   .meta
#     .[name] = [value]
#   .links
#     .[linktype] = [array of links]
#
#  link
#    .rel
#    .href
#    .title
#    .hreflang
#    .type
#


use strict;

use base qw(Template::Plugin);

sub load {
    my ($class, $context) = @_;
    return $class;
}

sub new {
    my ($class, $context) = @_;
    return bless { _CONTEXT => $context, basePath => '' }, $class;
}

### URI Processing Functions ###########################################

sub setBasePathFromRoot {
  my ($self, $basePath) = @_;

  $self->{basePath} = $basePath;
}

sub getRelativePath {
  my ($self, $pathFromRoot) = @_;

  my @basePath = split /\//, $self->{basePath};
  my @relPath  = split /\//, $pathFromRoot;

  my $pathNode;
  while ($pathNode = @basePath) {
    if ($pathNode eq $relPath[0]) {
      shift @relPath;
      shift @basePath;
    }
    else {
      last;
    }
  }
  foreach $pathNode (@basePath) {
    if (@basePath > 1) {
      unshift @relPath, '..';
      shift @basePath;
    }
  }
  $_ = join '/', @relPath;
  s/(index)?\.[a-zA-Z\-.]+$//;
  return $_;
}

### Config #############################################################

  my $defaultlang = 'en';
  my $defaultdir  = 'ltr';

### Debug PRINTER ######################################################

sub PrintMeta { # for debugging
  my %document = %{$_[0]};
  print "DEBUGPRINT\n";
  my ($key, $link, $attr);
  foreach $key (keys %document) {
    print "$key:\n$document{$key}\n";
  }
  foreach $key (keys %{$document{meta}}) {
    print "  $key:\n$document{meta}->{$key}\n";
  }
  foreach $key (keys %{$document{links}}) {
    print "$key:\n";
    foreach $link (@{$document{links}->{$key}}) {
      print "  link:\n";
      foreach $attr (keys %$link) {
        print "    $attr: $link->{$attr}\n";
      }
    }
  }
}

### Regex SHORTHANDS ###################################################

  # match any number of attrs
  my $attrs = q#(?:\s+\w+=(?:"[^"]*"|'[^']*'))*#;

  # match an attribute value (in quotes) and remember as $2
  my $attrval = q#(["'])\s*([\s\S]*?)\s*\1#;

### Extraction MAIN ####################################################

sub extract {
  my ($self, $content) = @_;

  my %document;
  #print $content;
  if ($content =~ s#([\s\S]*?)<head$attrs>([\s\S]*)<title>\s*([^<]*?)\s*</title>([\s\S]*?)</head\s*>##i) {
                   # prolog                                   title               head
    my $prolog = $1;
    my $title = $3;
    my $head = $2 . $4;
    $head =~ s/<\?wrapper ignore\??>[\s\S]*?<\?wrapper end-ignore\??>//;

    $document{head} = $head;

    ($document{doctype}, $document{format},
     $document{lang}, $document{dir}) = ParseProlog($prolog);

    ($document{meta}, $document{links}) = ParseHead($head);

    $document{title} = $title;
  }

  $content =~ s#(?:<body$attrs>|</body\s*>|</html\s*>)##g;
  $document{content} = $content;
  return \%document;
}

### Parse PROLOG #######################################################

sub ParseProlog {
  local $_ = $_[0];
  my ($doctype, $format);
  my $lang = $defaultlang;
  my $dir  = $defaultdir;
  if (s#[\s\S]*?(<!DOCTYPE .+?"-//W3C//DTD (HTML|XHTML).+?"[\s\S]*?>)##) {
    $doctype = $1;
    $format = $2;
  }
  if (m#<html($attrs)>#i) {
    my $htmlAttrs = $1;
    if ($htmlAttrs =~ m#lang=$attrval#i) {
	  $lang = $2;
      if ($htmlAttrs =~ m#dir=$attrval#i) {
        $dir = $2;
      }
    }
  }
  return ($doctype, $format, $lang, $dir);
}

### Parse HEAD #########################################################

sub ParseHead {
  my $head = $_[0];
  my %meta;
  my %links;

  my @bits = split(/</, $head);
  foreach $_ (@bits) {
    if (m#meta($attrs)/?>#i) {
      $_ = $1;
      if (m#name=$attrval#i) {
        my $name = $2;
        if (m#content=$attrval#i) {
          $meta{$name} = $2;
        }
      }
    }
    elsif (m#^link($attrs)/?>#si) { #parse link
      $_ = $1;
      if (m#rel=$attrval#) {
        my $relStr = $2;
        unless ($relStr =~ m#stylesheet|script|icon#i) {
          my %link;
          $link{rel} = $relStr;
          if (m#href=$attrval#i) {
            $link{href} = $2;
          }
          if (m#hreflang=$attrval#i) {
            $link{hreflang} = $2;
          }
          if (m#type=$attrval#i) {
            $link{type} = $2;
          }
          if (m#title=$attrval#i) {
            $link{title} = $2;
          }
          $relStr =~ s/^\s*(.*\S)\s*$/$1/;
          my @relations = split(/\s+/,$relStr);
          my $rel;
          foreach $rel (@relations) {
            # normalize values
            $rel = lc $rel;
            $rel = 'prev' if ($rel eq 'previous');
            $rel = 'toc' if ($rel eq 'contents');
            push (@{$links{$rel}}, \%link);
          }
        }
      }
    }
  }
  return (\%meta, \%links);
}

1;

__END__

=head1 NAME

Bugzilla::Template::Plugin::Hook

=head1 DESCRIPTION

Template Toolkit plugin to process hooks added into templates by extensions.

=head1 SEE ALSO

L<Template::Plugin>,
L<https://bugzilla.mozilla.org/show_bug.cgi?id=229658>
