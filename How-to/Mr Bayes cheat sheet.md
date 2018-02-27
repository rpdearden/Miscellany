**MRBAYES CHEAT SHEET**

**A selection of simple MrBayes commands with reminders as to what they do**
***
**BASICS**

* Create Log
```
log start filename=MrBayes_practical.txt
```
* Set Directory
```
set dir=/Users/rpd14/Documents
```
* Execute file
```
Execute /Users/rpd14/Documents/PhD/MrBayesfiles/Thomas_MrBayes/Data/TotalEvidence_Primates.nex
```
* Mr Bayes block bracket
```
begin mrbayes;
    ...;
end;
```
***
**CONSTRAINTS/DATA PARTITIONING**

* Set outgroup
```
outgroup Lemur_catta
```
* Set subset (eg. fossil taxa)
```
taxset fossils=13-20
```
* Add in constraints
```
constraint root=1-.
constraint Haplorhini=2-.
constraint Simiiformes=3-.
constraint Catarrhini=3-11
constraint Hominidae=3-7
constraint Cercopithecidae=8-11
```
* Partition data
```
charset DNA=1-898
charset morphology=899-1089
```
* Handle partitions
```
partition my_parition=2: DNA, morphology
set partition=my_partition
```
***
**MODELS and PRIORS**
* Set up model
```
lset applyto=(1) nucmodel=4by4 nst=6 rates=gamma Ngammacat=4 covarion=no
```
* View model settings
```
help lset
```
* Set Priors
```
prset applyto=(all) ratepr=variable
```
* Summarise all parameters
```
showmodel
```
***
**RUN ANALYSIS**
```
mcmc ngen=10000 samplefreq=10
```
***
**READOUT RESULTS**
* Summarise parameters (with burnin at 25% of samples)
```
sump burnin = 250
```
* Summarise trees (with burnin at 25% of samples)
```
sumt burnin = 250
```
***
**APPENDING ANALYSES**
If you end an analysis early you can continue to run it via the checkpoint files (.ckp) that MrBayes produces.
I had a bit of trouble getting this to work, but the steps I originally used were (including some which might be unnecessary):

* Ensure all output files have same names as before (including log I think)
* Setting the directory (not sure this actually makes a difference, but it worked after)
* Executing the original matrix
* Setting the model and prior (as previously used, with prset and lset)
* running the mcmc, defining the ngen (including those already run+your additional ones) your sample frequency (obvs identical to before) and setting append=yes.
* eg. mcmc ngen=12000000 (orig. 10000000+add.2000000) samplefreq=1000 append=yes;
* This should then run the analysis continously
```
mcmc ngen=10000000 samplefreq=1000 append=yes;
```