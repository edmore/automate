#! /bin/bash

###########################################################################
# Description - Convert tex to pdf
#             - incorporating any bibliography changes
# Author - www.edmoremoyo.com
###########################################################################

if [ -z "$1" ]; then
    echo "Please supply the name of the tex file (without an extension)."
else
# remove files so you start on new slate
    rm -f *.aux *bbl *.blg *.dvi *~

# generate bibliography
    /usr/texbin/latex --shell-escape $1
    /usr/texbin/bibtex $1
    /usr/texbin/latex --shell-escape $1
    /usr/texbin/latex --shell-escape $1

# create pdf file and open
    /usr/texbin/pdflatex --shell-escape $1.tex
    open $1.pdf
fi
