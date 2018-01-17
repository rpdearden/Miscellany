**MANIPULATING TREES IN R**

**An (extremely basic) reminder of tree functions in R (mostly [entirely?] in ape)**
***

**read in Newick tree**
read.tree("file.tre")

**read in Nexus tree (or file)**
read.nexus("file.nex")

**plot tree**
plot.phylo(Object)

**ladderize**
ladderize(Object)

**plot as pdf**

pdf("Maj.pdf", width=4, height=7)

plot(Maj, cex=0.7, show.node.label=TRUE, adj=0, label.offset=0.5)

dev.off()

**(to get rid of edge lengths)**
pdf("tree.pdf", width=4, height=7)

plot(tree, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(nodes, frame="none", cex=0.7)

dev.off()

**Plot a tree with node labels**
pdf("nodetree.pdf", width=10, height=7)
plot(tree, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(cex=0.5)
tiplabels(cex=0.5)
dev.off()
**Extracting posterior probabilities from MrBayes output**

```r

#load phylotate + ape
library(ape)
library(phylotate)

#Set directory
setwd("~/Documents/PhD/Ptomacanthus/Ptoma_phylo/Final_Final_Coates/Bayesian")

#Read in Mr bayes consensus tree, using phylotate to annotate with values
tree <- phylotate::read_annotated("~/Documents/PhD/Ptomacanthus/Ptoma_phylo/Final_Final_Coates/Bayesian/PtomMatrix_FINAL_FINAL.nex.con.tre")

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

#Plot output as pdf - node labels specified have to be exactly all internal nodes, or the node values will shift
pdf("tree.pdf", width=5, height=7)
plot(tree, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
nodelabels(nodes2[41:72], adj=c(1,1.5), frame="none", cex=0.5)
dev.off()

```


