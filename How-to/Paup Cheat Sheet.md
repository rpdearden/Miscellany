**PAUP CHEAT SHEET**

**A selection of simple paup commands with reminders as to what they do**
***

**Set directory**
CD /Users/rpd14/Documents/PaupFiles/PaupWorking;

**Set up log**
Log File=Filename.log;

**Read in Matrix**
Execute Filename.nex;

**Read in constraints from .tre file**
Loadconstr File=Filename.tre;

**Show active constraints**
Showconstr

**set outgroup**
Outgroup taxon;

**root on outgroup**
set root = outgroup;


**Delete taxa**
Delete List taxa with commas
?
**Run heuristic search with constraints in place (and Giles et al. protocol, 1000 replicates and holding 5 trees at each step)**
hsearch Swap=TBR addseq=random Enforce=yes NReps=1000 Hold=5;

**Run heuristic search with constraints in place (and Giles et al. protocol, 1000 replicates and holding 5 trees at each step)**
hsearch Swap=TBR addseq=random Enforce=no NReps=1000 Hold=5;

**NCHUCK method (eg. in Davis 2012)**
**First ran a heuristic search for 25 random sequence additions to estimate shortest tree length (TS)**
hsearch swap=tbr NReps=25 Hold=1
**Use TS +1 for chuckscore in next step and hold no more than 500 trees on each replicate  greater than or equal to TS**
hsearch swap=tbr NReps=10000 Chuckscore=TS+1 Nchuck=500

**Save trees (all)**
SaveTrees File=Filename.tre

**Generate consensuses and save to file**
ConTree All / Strict=yes Majrule=yes TreeFile=Filename.tre;

**Stop log**
Log Stop=yes;