#! /bin/bash

if [ -z "$1" ]; then
    echo "Please supply an argument."
else
# remove files so you start on new slate
    rm -f *.aux *bbl *.blg *.dvi *~

# generate bibliography
    /usr/texbin/latex $1 &> /dev/null
    /usr/texbin/bibtex $1 &> /dev/null
    /usr/texbin/latex $1 &> /dev/null
    /usr/texbin/latex $1 &> /dev/null

# create pdf file and open
    /usr/texbin/pdflatex $1.tex &> /dev/null
    open $1.pdf
fi
