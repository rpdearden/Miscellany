**PAUP CHEAT SHEET**

**A selection of simple paup commands with reminders as to what they do**
***

**Set directory**
CD /Users/rpd14/Documents/PaupFiles/PaupWorking;

**Set up log**
Log File=Filename.log;

**Read in Matrix**
Execute Filename.nex;

**Read in monophyly constraint from .tre file**
Loadconstr File=Filename.tre;

**Read in backbone constraint from .tre file**
Loadconstr File=Filename.tre Asbackbone = yes;

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

**Read in tree**
Gettrees file=filename;

**Agreement subtree**
Agree [trees];

**Apomorphy list**
describe 1 /Apolist opt=deltran

**Bootstrapping**
bootstrap nreps=100 search=heuristic /addseq=random;

**save trees with bootstrap values - ie. resample with replacement**
savetrees from=1 to=1 savebootp=nodelabels file=filename.tre;

**Bremer support values (indirect) - how many additional steps does it take for the node to break down?**
* Run search
* Run search again, retaining all trees of MPT+5 steps
	. hsearch keep="MPT+5";
* make a strict consensus
* All nodes that remain have Bremer score of 5 (highest)
* Filter through going down - as nodes are lost they are their Bremer decay indices
	filter maxscore=MPT+4;