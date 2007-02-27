all: ladspa-swh.html ladspa-swh.pdf

test:
	touch ../amp_1181.xml
	make view

view: ladspa-swh.ps
	gv ladspa-swh.ps

ladspa-swh.tex: ../*.xml
	./makedocs.pl ../*.xml > ladspa-swh.tex
	latex ladspa-swh.tex
	latex ladspa-swh.tex

ladspa-swh.dvi: ladspa-swh.tex
	latex ladspa-swh.tex
	latex ladspa-swh.tex

ladspa-swh.ps: ladspa-swh.dvi
	dvips ladspa-swh.dvi -o

ladspa-swh.pdf: ladspa-swh.ps
	ps2pdf ladspa-swh.ps

ladspa-swh.html: ladspa-swh.tex
	tth -v -Lladspa-swh <ladspa-swh.tex >ladspa-swh-tmp.html
	./addstyle.pl <ladspa-swh-tmp.html >ladspa-swh.html
	rm -f ladspa-swh-tmp.html
	date -I > timestamp.txt
