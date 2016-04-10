#!/bin/bash

function quick {
	pdflatex main.tex
	mv main.pdf ../disparity-thesis-paper.pdf
}

function full {
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex
	mv main.pdf ../disparity-thesis-paper.pdf
}

if [ $# -eq 0 ]; then
		echo "No arguments supplied, usage:"
		echo "./build.sh quick"
		echo "./build.sh full"
fi

if [ "$1" = "quick" ]; then
	quick
fi

if [ "$1" = "full" ]; then
	full
fi

exit 0
