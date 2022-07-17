#!/bin/bash

# Borrowed somewhat from https://medium.com/learning-machine-learning/present-your-data-science-projects-with-jupyter-slides-75f20735eb0f

PREFIX=IntroExpectations
PTH=slides

# Download reveal.js
#wget https://github.com/hakimel/reveal.js/archive/master.zip
#unzip master.zip


# Available reveal themes: https://github.com/hakimel/reveal.js/tree/master/css/theme/source

# Convert ipynb to html
#jupyter nbconvert ${PTH}/${PREFIX}.ipynb --to slides --post serve \
#	--SlidesExporter.reveal_theme=solarized \
#	--SlidesExporter.reveal_scroll=True \
#	--SlidesExporter.reveal_transition=fade
jupyter nbconvert ${PTH}/${PREFIX}.ipynb --to slides \
	--SlidesExporter.reveal_theme=solarized \
	--SlidesExporter.reveal_scroll=True \
	--SlidesExporter.reveal_transition=fade
mv ${PTH}/${PREFIX}.html ${PTH}/${PREFIX}.slides.html

# Convert ipynb to pdf
jupyter nbconvert ${PTH}/${PREFIX}.ipynb --to latex
mv ${PTH}/${PREFIX}.tex .
pdflatex ${PREFIX}.tex
rm ${PREFIX}.aux ${PREFIX}.log ${PREFIX}.out ${PREFIX}.tex
mv ${PREFIX}.pdf ${PTH}/${PREFIX}.slides.pdf
