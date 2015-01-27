package MozillaOrg::Template::Plugin::GetSize;

use LWP::UserAgent;

sub getfilesize{
  my ($s,$target,$prefix)= @_;
  $prefix     = 'https://ftp.mozilla.org/pub/mozilla.org/webtools/' if(!$prefix);
  $target    = $prefix . $target;
  my $ua      = LWP::UserAgent->new;
  my $measure = 'bytes';
  my $req     = HTTP::Request->new(HEAD => "$target");
  my $res     = $ua->request($req);
  sleep 1;
  if ($res->is_success && $res->status_line =~ /200 OK/) {
    my $size = $res->content_length;
    if ($size >= 1024){ $size = ceil($size / 1024); $measure = 'K';}
    if ($size >= 1024){ $size = ceil($size / 1024); $measure = 'M';}
    return ($size . $measure);
  }else{
    return ('fetch failed');
  }

}


sub ceil {
  my ($num) = @_;
  my ($tmp1, $tmp2);
  $tmp1 = $num * 10;
  $tmp2 += $tmp1 <=> ($tmp2 = int($tmp1));
  sprintf('%.1f', $tmp2 / 10);
}


### below is not used
sub load {
    my ($class, $context) = @_;
    return $class;
}

sub new {
    my ($class, $context) = @_;
    return bless { _CONTEXT => $context, basePath => '' }, $class;
}

1;
