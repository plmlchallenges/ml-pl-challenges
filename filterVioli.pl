#!/usr/bin/perl


$|=1;

open  (FH, $ARGV[0]) or die "Unable to open file";

@lines = <FH>;
close(FH);

$tag = $ARGV[1];
$block = $ARGV[2];

chop(@lines);
foreach my $l (@lines){
  my @v=split(',',$l);

  if ($v[12] ne ""){
    $o_lng= $v[10];
    $no_lng= $v[11];
    $ph= $v[9];
    @w=split("/", $ph);
    if ($no_lng eq "" || $no_lng !~ /$block/){
      foreach my $t (@w){
	print "$ARGV[1],$v[0],$v[12],$t\n";
      }
    }
}
}

#print @lines;

exit(0);
