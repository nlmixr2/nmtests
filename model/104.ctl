$PROB RUN# 104

$INPUT C ID TIME EVID AMT CMT WT DOSE DV

$DATA ../../data/104.csv IGNORE=C

$SUBROUTINES ADVAN2 TRANS2

$PK

TVCL=THETA(1)*(WT/70)**0.75
CL=TVCL*EXP(ETA(1))

TVV2=THETA(2)*(WT/70)
V=TVV2*EXP(ETA(2))

TVKA=THETA(3)
KA=TVKA*EXP(ETA(3))


$ERROR
IPRED=A(2)/(V/1000)
Y=IPRED*EXP(ERR(1))

CP = IPRED

REPI = IREP

$THETA
(1,   FIX) ;; CL
(20,  FIX) ;; V
(1.5, FIX) ;; KA

$OMEGA
0.09 FIX
0.2 FIX
0.5 FIX

$SIGMA
0.02 FIX

$TABLE FILE=TAB REPI ID TIME EVID CP IPRED PRED DV DOSE NOPRINT NOHEADER NOAPPEND

$SIMULATION (2674474) SUBPROBLEM = 1000 ONLYSIMULATION
