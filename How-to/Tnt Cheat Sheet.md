**TNT CHEAT SHEET**
Assembled from the internets, and the notes of Mr Ryan Marek.
**A selection of simple tnt commands with reminders as to what they do**
***

**Set directory**
```
cdir DIRECTORY;
```
**Run log**
```
log Fish.log;
```
**list commands**
```
help;
```
**read in constraint**
* I find this easiest to do by combing the constraint tree with your data in mesquite and exporting as a tnt file.  (N is the tree number, so probably 0)
```
force =&N;
```
**Enforce constraint**
```
constrain =;
```
**Process file**
```
proc FILENAME.tnt;
```
**set outgroup**
```
outgroup OUTGROUP
```
**Make terminal nodes taxon names**
```
taxname= ;
```
**increase memory allocation**
* (default is 16mb I believe).  This must be done before reading in the data.
```
mxram 2000;
```
**Change tree buffer.**
* This must be done after reading in the data.
```
hold 10000;
```
**Exhaustive search (implicit enumeration)**
```
ienum ;
```
**Random addition sequences (example with tbr, 1000replicates, holding 10 trees at each step)**
```
mult= tbr ratchet replic 10000 hold 100 ;
```
**Plot all trees**
```
tplot ;
```
**plot strict consensus**
```
qnelsen ;
```
**plot majority rule**
```
majority ;
```
**map characters**
```
map ;
```
**Saving trees**
* tnt does this weirdly, you have to open, export, and close a tree file. Below will export both a tree file and a nexus file with matrix + trees
```
tsave *trees.tre
export *trees.nex
tsave/;
```
**Print majority svg**
* NOTE: if you don't clear ttags at the end (ttags -;) it will stack all recorded ttags and confuse you
```
ttags= ;
majority ;
ttag &Majority.svg ;
ttags -;
```
**Print strict svg**
```
ttags= ;
qnelsen ;
ttag &Strict.svg;
ttags -;
```
**Bootstrapping (with svg print)**
```
ttags= ;
resample boot replic 1000 ;
ttag &FILENAME.svg ;
```
**Jackknifing (with svg print)**
```
ttags= ;
resample jak replic 1000 ;
ttag &FILENAME.svg ;
```
**Bremer support**
Not quite got working, but can use Bremer.run [script](http://phylo.wdfiles.com/local--files/tntwiki/Bremer.run)

**Consistency + Retention indices**
Not quite got working, but can use stats.run [script](http://phylo.wdfiles.com/local--files/tntwiki/Stats.run)



