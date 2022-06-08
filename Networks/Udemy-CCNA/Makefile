TARGET = ciscoCLI

pdf: $(TARGET).md
	pandoc $(TARGET).md -o $(TARGET).pdf --standalone --toc
	cp $(TARGET).pdf $(HOME)/MyWindows/Working/

clear:
	rm -f *.pdf
	clear && exa
