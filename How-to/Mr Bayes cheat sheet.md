**MRBAYES CHEAT SHEET**

**A selection of simple MrBayes commands with reminders as to what they do**
***
**BASICS**

#Create Log
log start filename=MrBayes_practical.txt

#Execute file
Execute /Users/rpd14/Documents/PhD/MrBayesfiles/Thomas_MrBayes/Data/TotalEvidence_Primates.nex

###Mr Bayes block bracket
begin mrbayes;
    ...;
end;
***
**CONSTRAINTS/DATA PARTITIONING**

#Set outgroup
outgroup Lemur_catta

#Set subset (eg. fossil taxa)
taxset fossils=13-20

#Add in constraints

constraint root=1-.
constraint Haplorhini=2-.
constraint Simiiformes=3-.
constraint Catarrhini=3-11
constraint Hominidae=3-7
constraint Cercopithecidae=8-11

#Partition data
charset DNA=1-898
charset morphology=899-1089

#Handle partitions
partition my_parition=2: DNA, morphology
set partition=my_parition
***
**MODELS and PRIORS**
#Set up model
lset applyto=(1) nucmodel=4by4 nst=6 rates=gamma Ngammacat=4 covarion=no

#View model settings
help lset

#Set Priors
prset applyto=(all) ratepr=variable

#Summarise all parameters
showmodel
***
**RUN ANALYSIS**

mcmc ngen=10000 samplefreq=10
***
**READOUT RESULTS**
Summarise parameters (with burnin at 25% of samples)
sump burnin = 250

Summarise trees (with burnin at 25% of samples)
sumt burnin = 250