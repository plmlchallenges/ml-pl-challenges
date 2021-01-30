#!/usr/bin/perl


$|=1;

open  (FH, $ARGV[0]) or die "Unable to open file";

@lines = <FH>;
close(FH);


my @_PHASES=('mr','dcp','fp','mb','me','md','mm','no');
my @_TAGS=('C_SHARP','C_CPP','MATLAB','JAVA', 'R','PYTHON');

my %h=();
chop(@lines);
foreach (@lines){
  next if (/^\s*$/);
  ($lang,$id,$not_lang,$other_lang,$answer,$time,$ph)=split(',');
  if ($ph eq "all"){
    $a='y';
    $a='n' if ($answer == 0);
    foreach my $p ( @_PHASES){
      $h{$lang}{$p}{$a}++;
    }
    next;
  }
  $lph=find_phase($ph);
  if ($lph eq "" || $lang eq ""){
    die "Huh ... $_\n";
  }
  #print "$lang, $answer, $time, $ph\n";
  $a='y';
  $a='n' if ($answer == 0);
  $h{$lang}{$ph}{$a}++;
}

foreach my $l (@_TAGS){
  $tot = 0;
  print "$l ";
  foreach my $p (@_PHASES){
    $y=$h{$l}{$p}{'y'};
    $n=$h{$l}{$p}{'n'};
    $t = $n+$y;
    if ($t != 0){
      $perc = 100*($y/$t)+0.5;
      $perc=sprintf("%.0f", $perc);
    }else{
      $perc='-';
    }
    print "& $perc";
    $tot +=$t;
  }
  print "\n",
}
#print @lines;

exit(0);

sub find_phase{
  my $s = shift;

  for (my $i=0;$i <=$#_PHASES; $i++){
#print "scan $s in $_PHASES[$i]\n";
    if ($s  eq $_PHASES[$i]){

      return  $_PHASES[$i];
    }
  }
   return "";
}


# get a string line  MATLAB and returna ma
sub find_lang_code{
  my $s = shift;

  for (my $i=0;$i <=$#_TAGS; $i++){
#print "scan $s in $_TAGS[$i]\n";
    if ($s  eq $_TAGS[$i]){

      return  $_LABELS[$i];
    }
  }
   return "";
}
# get a string line ma and returna MATLAB
sub find_lang_tag{
  my $s = shift;
  for (my $i=0;$i <=$#_LABELS; $i++){
    if (  $_LABELS[$i] =~ $s ){ # take the first whatever ...
      return  $_TAGS[$i];
    }
  }
  return "";
}

