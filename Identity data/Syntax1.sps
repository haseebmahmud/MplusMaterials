
 * Opening a data file

GET
  FILE='C:\Identity data\Identity II\ZA3910_v2-1-0.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.


* Subsetting sample
USE ALL.
COMPUTE filter_$=(COUNTRY = 4 | COUNTRY = 8 | COUNTRY = 10 | COUNTRY = 14 | COUNTRY = 26 | COUNTRY 
    = 28 | COUNTRY = 32 | COUNTRY = 33 | COUNTRY = 37).
VARIABLE LABELS filter_$ 'COUNTRY = 4 | COUNTRY = 8 | COUNTRY = 10 | COUNTRY = 14 | COUNTRY = 26 '+
    '| COUNTRY = 28 | COUNTRY = 32 | COUNTRY = 33 | COUNTRY = 37 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

* Recode

DATASET ACTIVATE DataSet1.
RECODE v74 (1=1) (2=0) INTO v74_new.
VARIABLE LABELS  v74_new 'VoteORNot'.
EXECUTE.

VALUE LABELS v74_new
1 'EU'
0 'NoEU'.
EXECUTE. 

FREQUENCIES v74_new.

* 

