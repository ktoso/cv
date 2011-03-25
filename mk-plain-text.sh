#!/bin/sh
catdvi konrad_malawski_cv.dvi 2> /dev/null \
	egrep --invert-match 'I hereby |accordance |^ * v.* @ ' | \
	sed -e 's/?  /*  /g'
