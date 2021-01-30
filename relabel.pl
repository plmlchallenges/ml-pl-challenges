#!/usr/bin/perl


$|=1;

open  (FH, $ARGV[0]) or die "Unable to open file";

@lines = <FH>;
close(FH);

$file_tag = $ARGV[1];


my @_LABELS=('ma','c+','c#','r','py','ja');
my @_TAGS=('MATLAB','C_CPP','C_SHARP','R','PYTHON','JAVA');

chop(@lines);
foreach my $l (@lines){
  next if ($l =~ /^\s*$/);
  $tag = $file_tag;
  #print "#$l\n"; 
  my @v=split(',',$l);
  $o_lng= $v[10];
  $no_lng= $v[11];
  $ph= $v[9];

  if ($no_lng ne ""){ # is actually something else
    
    my $short_code=find_lang_code($tag);
    next if ($short_code eq "");
    #print "\t\t>>$short_code<< per >>$no_lng<<\n";
    if ( $no_lng =~ /$short_code/)
      {
	#print "##MISCLA\n";
	#print "\t\tChange language in $no_lng due to $short_code change to $o_lng \n";
	next if ($o_lng eq ""); # skip we do not know the alternative language
	my $ltag = find_lang_tag($o_lng);
	next if ($ltag eq "");
	$tag = $ltag;  # assign a different language
	#print "##REA\n";
	#print "\t\tAssign language in $no_lng due to $o_lng change to $ltag  \n";
      }else{
	# keep in this langiuage 
      }
  }
  # force reconding
  
  #next if ($ph=~/\?/);
  

  $answer_time = $v[12];
  $answer = 0;
  if ($v[12] ne ""){
    $answer = 1;
  }
  if ($ph eq "" || $ph =~/\?/){
    #warn "Missing phase in $tag,$v[0]\n";
    next;
  }
  @w= split("/", $ph);
  #$w[0]=$ph;
  foreach my $t (@w){
    $t = 'dcp' if ($t =~ /\s*dc\s*$/ || $t =~ /\s*dp\s*$/);
    $t = 'fp' if ($t =~ /\s*fe\s*$/);
    next if ($t=~/\?/);
    print "$tag,$v[0],$no_lng,$o_lng,$answer,$answer_time,$t\n";
  }
  
  #  if ($no_lng eq "" || $no_lng !~ /$block/){
  #    foreach my $t (@w){
  # print "$ARGV[1],$v[0],$v[12],$t\n";
  #    }
  #  }

  
}


#print @lines;

exit(0);
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

