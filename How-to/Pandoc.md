**PANDOC**

* I usually use the manual/walkthrough for this ([which is pretty good](https://pandoc.org/) )

* In Mac this is achieved in Terminal - you'll first have to navigate to the directory where you want to use this beforehand

* My standard go to command is then the following, which converts from Latex to word, including a bib file with refs:
		```
		pandoc Ptom_manu_draft3.tex -s -o Ptom_manu_draft3.docx --bibliography=Ptom_Manu.bib
		```