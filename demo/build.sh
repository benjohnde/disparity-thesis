#!/bin/bash

function quick {
	pdflatex demo.tex
	mv demo.pdf ../disparity-thesis-demo.pdf
}

function full {
	pdflatex demo.tex
	bibtex demo
	pdflatex demo.tex
	pdflatex demo.tex
	mv demo.pdf ../disparity-thesis-demo.pdf
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
