#!/bin/sh
cd `dir $0`;

texi2dvi konrad_malawski_cv.tex
texi2dvi konrad_malawski_cv.tex
catdvi konrad_malawski_cv.dvi 2> /dev/null | egrep --invert-match 'I hereby |accordance |^ * v.* @ ' | sed -e 's/?  /*  /g' > konrad_malawski_cv.txt
