**TNT CHEAT SHEET**
Assembled from the internets, and the notes of Mr Ryan Marek.
**A selection of simple tnt commands with reminders as to what they do**
***

**Set directory**
cdir DIRECTORY;

**list commands**
help ;

**Process file**
proc FILENAME.tnt;

**set outgroup**
outgroup OUTGROUP

**Make terminal nodes taxon names**
taxname= ;

**Change tree buffer**
hold 10000

**Exhaustive search (implicit enumeration)**
ienum ;

**Random addition sequences (example with tbr, 1000replicates, holding 10 trees at each step)**
mult= tbr replic 1000 hold 10 ;

**Plot all trees**
tplot ;

**plot strict consensus**
qnelsen ;

**plot majority rule**
majority ;

**map characters**
map ;

**Saving trees(tnt does this weirdly, you have to open, export, and close a tree file. Below will export both a tree file and a nexus file with matrix + trees**
tsave *filename.tre
export *filename.nex
tsave/;

**Bootstrapping (with svg print)**
ttags= ;
resample boot replic 1000 ;
ttag &FILENAME.svg ;

**Jackknifing (with svg print)**
ttags= ;
resample jak replic 1000 ;
ttag &FILENAME.svg ;

**Bremer support**
Not quite got working, but can use Bremer.run [script](http://phylo.wdfiles.com/local--files/tntwiki/Bremer.run)

**Consistency + Retention indices**
Not quite got working, but can use stats.run [script](http://phylo.wdfiles.com/local--files/tntwiki/Stats.run)



