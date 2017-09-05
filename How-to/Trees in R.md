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

pdf("Adams.pdf", width=7, height=7)
plot(Adams, cex=0.7, show.node.label=TRUE, adj=0, label.offset=0.5)
dev.off()

**(to get rid of edge lengths)**
pdf("Bayes.pdf", width=4, height=7)
> plot(Bayes, cex=0.7, show.node.label=TRUE, use.edge.length=FALSE, adj=0, label.offset=0.5)
> dev.off()