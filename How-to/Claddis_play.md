**USING CLADDIS**

**Claddis is a package by Graham Lloyd that allows you to carry out various phylogenetic techniques - information available on his [Github](https://github.com/graemetlloyd/Claddis)**

* Most of this is from a tutorial which can be found [here](http://www.graemetlloyd.com/teaching/RE2014/disparity_and_rates.r)

* Read in data:
```
nexus.data <- ReadMorphNexus("http://www.graemetlloyd.com/nexus/Cullen_etal_2013a.nex")
```
* Inapplicables and unknown data need to be NA, with all data as strings (text)

***

* Safe taxonomic reduction

#This is handled through a function 
```
safe.dataset<-SafeTaxonomicReduction(dataset)
```
#This spits out a list of taxa that can be removed, the reduced matrix, and a matrix of the removed taxa
#To see safely removable taxa:
```
safe.dataset$str.list
```
#This gives three columns: Junior (taxon to be removed), Senior (taxon it's the same as), and Rule (rule under which can be removed).
						
						
* Morphological distance matrices - these can be done but I've been to lazy to transcribe exactly how here

* 