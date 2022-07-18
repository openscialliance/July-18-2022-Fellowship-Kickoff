#!/bin/bash

# Borrowed somewhat from https://medium.com/learning-machine-learning/present-your-data-science-projects-with-jupyter-slides-75f20735eb0f

PREFIX=IntroExpectations
BUILD=slides
RENDER=docs

# Download reveal.js
#wget https://github.com/hakimel/reveal.js/archive/master.zip
#unzip master.zip

# Available reveal themes: https://github.com/hakimel/reveal.js/tree/master/css/theme/source

jupyter nbconvert ${BUILD}/${PREFIX}.ipynb --to slides \
	--SlidesExporter.reveal_theme=solarized \
	--SlidesExporter.reveal_scroll=True \
	--SlidesExporter.reveal_transition=fade
mv ${BUILD}/${PREFIX}.slides.html ${RENDER}/index.html

# Convert ipynb to pdf
jupyter nbconvert ${BUILD}/${PREFIX}.ipynb --to latex
mv ${BUILD}/${PREFIX}.tex .
pdflatex ${PREFIX}.tex
rm ${PREFIX}.aux ${PREFIX}.log ${PREFIX}.out ${PREFIX}.tex
mv ${PREFIX}.pdf ${RENDER}/slides.pdf
