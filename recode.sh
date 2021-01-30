./relabel.pl 1-Matlab-acc.csv MATLAB > MATLAB_recoded.csv
 ./relabel.pl  3-Cplus-acc.csv C_CPP  > C_CPP_recoded.csv
 ./relabel.pl  2-Csharp-acc.csv C_SHARP > C_SHARP_recoded.csv
./relabel.pl  4-R-acc.csv R  > R_recoded.csv
 ./relabel.pl 5-Python-acc.csv PYTHON  > PYTHON_recoded.csv
 ./relabel.pl 6-java-acc.csv JAVA > JAVA_recoded.csv
cat *_recoded.csv > allRecoded.csv 
