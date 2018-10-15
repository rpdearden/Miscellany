**MANIPULATING TREES IN R**

**An (extremely basic) reminder of tree functions in R (mostly [entirely?] in ape)**
***

**read in Newick tree**
```r
read.tree("file.tre")
```
**read in Nexus tree (or file)**
```r
read.nexus("file.nex")
```
**plot tree**
```r
plot.phylo(Object)
```
**ladderize**
```r
ladderize(Object)
```
**plot as pdf**
```r
pdf("Maj.pdf", width=4, height=7)

plot(Maj, cex=0.7, show.node.label=TRUE, adj=0, label.offset=0.5)

dev.off()
```
**(to get rid of edge lengths)**

```r
pdf("tree.pdf", width=4, height=7)

plot(tree, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(nodes, frame="none", cex=0.7)

dev.off()
```
**Plot a tree with node labels**
```r
pdf("nodetree.pdf", width=10, height=7)
plot(tree, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(cex=0.5)
tiplabels(cex=0.5)
dev.off()
```

**Making strict consensus trees**
* I particularly use this for tnt output, in which the outputted trees are an absolute pain in the arse to deal with - to do this I first import the trees from the tnt output nexus into mesquite and export them as a nexus file.
* This will output a pdf of the tree, as well as a nexus file containing the tree in Newick format
```r
strictcon <- consensus(trees, p=1)
write.nexus(strictcon, file="Strict.nex", translate=FALSE)
pdf("Strict.pdf", width=7, height=20)
plot(strictcon, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
dev.off()
```

**Making majority rule consensus trees**
* I particularly use this for tnt output, in which the outputted trees are an absolute pain in the arse to deal with and svg consensuses ugly - to do this I first import the trees from the tnt output nexus into mesquite and export them as a nexus file.
* I dug the consensus method out from [here](http://grokbase.com/t/r/r-sig-phylo/095jx67dge/consensus-frequencies)
```r
#Make majority tree
majcon <- consensus(trees, p=0.5)
#Work out node values
nodeconc<-prop.clades(majcon, trees)/length(trees)
#Function from below to make these into percentages
MultRound <- function(nodes){
			(signif(nodes, digits=2))*100
				}
#Do it
nodeperc<- lapply(nodeconc, MultRound)
#Plot pdf - twiddle with settings
pdf("Majority.pdf", width=7, height=20)
plot(majcon, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(nodeperc, adj=c(1,1.5), frame="none", cex=0.5)
dev.off()
```

**Making Adams consensus trees**
* I've been too lazy to write something for this in R, so instead I import the tree from PAUP
* This will output a pdf of the tree, as well as a nexus file containing the tree in Newick format
```r
Adams <- read.nexus("Adams.nex")
pdf("Adams.pdf", width=7, height=20)
plot(Adams, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
dev.off()
```

**Extracting posterior probabilities from MrBayes output**

```r

#load phylotate + ape
library(ape)
library(phylotate)

#Set directory
setwd("DragDirHERE")

#Read in Mr bayes consensus tree, using phylotate to annotate with values
tree <- phylotate::read_annotated("DragTreFileHERE")

#ladderize tree
tree <- ladderize(tree)

#Make object for node comments
node_comment<-tree$node.comment

#Thomas's function to extract values (may have to modify exacly where it strsplits
get.pp <- function(node_comment) {
    return(as.numeric(strsplit(strsplit(node_comment, "&prob=")[[1]][2], split = ",")[[1]][1]))
}
#Calculate node values using Thomas's function
nodes<- lapply(node_comment, get.pp)

#Function to make decimal post. probs into percentages
MultRound <- function(nodes){
			(signif(nodes, digits=2))*100
				}

#Run aforementioned function
nodes2<- lapply(nodes, MultRound) 

#Plot output as pdf - node labels specified have to be exactly all internal nodes, or the node values will shift - check this whenever using a different tree.
#To work out which range this is:
tree
#And then in the node labels [ntips+1, ntips+nnodes]
#I'm sure there is a more elegant way of fixing this so only internal nodes are considered- alas, I'm bollocksed if I know what it is. 
pdf("tree.pdf", width=5, height=10)
plot(tree, cex=0.5, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(nodes2[89:152], adj=c(1,1.5), frame="none", cex=0.5)
dev.off()

```

**Plotting Consensus networks**

```r

#Load packages
library(ape)
library(phangorn)

#set directory
setwd("~/Documents/PhD/Diplacanthus/Consensus networks")

#read in trees
Tree1 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/BrazDeWint2016.tre")
Tree2 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/Burrow2016.tre")
Tree3 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/Coates2018.tre")
Tree4 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/King2016.tre")
Tree5 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/Lu2016.tre")
Tree6 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/Qiao2016.tre")
Tree7 <- read.nexus("~/Documents/PhD/Diplacanthus/Consensus networks/Zhu2016.tre")

#Prune trees for same number of tips - (should definitely loop this)
prunes<-c("Euthacanthus", "Ramirosuarezia", "Latviacanthus")
PT1 <- drop.tip(Tree1, prunes)
PT2 <- drop.tip(Tree2, prunes)
PT3 <- drop.tip(Tree3, prunes)
PT4 <- drop.tip(Tree4, prunes)
PT5 <- drop.tip(Tree5, prunes)
PT6 <- drop.tip(Tree6, prunes)
PT7 <- drop.tip(Tree7, prunes)

#Combine Trees into the same object
Trees <- c(PT1, PT2, PT3, PT4, PT5, PT6, PT7)

#Create consensus network and plot at 0.5
cnet05 <- consensusNet(Trees, prob = 0.5)
pdf("CNet_0.5.pdf", width=10, height=10)
plot(cnet05, type="2D", cex=0.8)
dev.off() 

#Create consensus network and plot at 0.3
cnet03 <- consensusNet(Trees, prob = 0.3)
pdf("CNet_0.3.pdf", width=10, height=10)
plot(cnet03, type="2D", cex=0.8)
dev.off() 

#Create consensus network and plot at 0.1
cnet01 <- consensusNet(Trees, prob = 0.1)
pdf("CNet_0.1.pdf", width=10, height=10)
plot(cnet01, type="2D", cex=0.8)
dev.off() 

```

**Using strap to plot phylo against time**

```r
#Load packages
library(strap)

#set directory
setwd("~/Documents/PhD/Big_Chondrichthyan_Phylogeny/TNT1")

#Read in tree
tree <- read.nexus("Strict.nex")

#Read in dates - these should be in a 3 column CSV with Taxon, Fad, and Lad
Dates<-read.csv("~/Documents/PhD/Big_Chondrichthyan_Phylogeny/TNT1/Dates.csv", header=TRUE, row.names=1)

#Create time calibrated tree
tree_1 <-DatePhylo(tree, Dates, method="equal", rlen=1)

# Plot tree with dates
geoscalePhylo(tree=tree_1, ages=Dates, boxes="Age", cex.tip=0.4)

#Example

tree <- read.nexus("Strict.nex")
Dates <- read.csv("CoatesDates2.csv",header=TRUE, row.names=1)
tree_1 <-DatePhylo(tree, Dates, method="equal", rlen=1)
pdf("Geoscale.pdf", width=10, height=7)
geoscalePhylo(tree=tree_1, ages=Dates, boxes="Age", cex.tip=0.4, direction="rightwards", x.lim=(35), cex.ts=0.5)
dev.off()


```
