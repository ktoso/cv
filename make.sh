#!/bin/sh
cd `dir $0`;

echo 'Make dvi...'
texi2dvi konrad_malawski_cv.tex

echo 'Make pdf...'
texi2pdf konrad_malawski_cv.tex

echo 'Make plaintext...'
catdvi konrad_malawski_cv.dvi 2> /dev/null | \
	egrep --invert-match 'I hereby |accordance |^ * v.* @ ' | \
	sed -e 's/?  /*  /g' > konrad_malawski_cv.txt

echo 'Decorate plaintext better...'
# replace links for autolink()
sed -i -e 's|blog.project13.pl|http://blog.project13.pl|g' \
       -e 's|linkedin.com|http://linkedin.com|g' \
       -e 's|github.com|http://github.com|g' \
       konrad_malawski_cv.txt
# remove too much empty lines
#sed -i '/^&/d' konrad_malawski_cv.txt

# fix some weird ? errors
sed -i -e 's/Certi?/Certif/g' \
       -e 's/Og?lnokszta?c?ce/Ogólnokształcące/g' \
       -e 's/?w/ów/g' \
       konrad_malawski_cv.txt

sed -i -e '2 s/.*/-------------------------------------------------------------------------------------------------------------------------------/g' konrad_malawski_cv.txt
