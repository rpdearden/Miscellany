**PANDOC**

* I usually use the manual/walkthrough for this ([which is pretty good](https://pandoc.org/) )

* Standard go to command is, which converts from Latex to word, including a bib file with refs:
		```
		pandoc Ptom_manu_draft3.tex -s -o Ptom_manu_draft3.docx --bibliography=Ptom_Manu.bib
		```
* Have to be in the directory where you want to use this