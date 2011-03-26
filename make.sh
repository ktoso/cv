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
       -e 's|me.project13.pl|http://me.project13.pl|g' \
       konrad_malawski_cv.txt

# remove too much empty lines
sed -i '/^$/d' konrad_malawski_cv.txt

# fix some weird ? errors
sed -i -e 's/Certi?/Certif/g' \
       -e 's/Og?lnokszta?c?ce/Ogólnokształcące/g' \
       -e 's/?w/ów/g' \
       -e 's/Pro?le/Profile/g' \
       konrad_malawski_cv.txt

sed -i -e '2 s/.*/-------------------------------------------------------------------------------------------------------------------------------/g' konrad_malawski_cv.txt

echo '-------------------------------------------------------------------------------------------------------------------------------' >> konrad_malawski_cv.txt
echo '          I hereby agree for processing the following personal information strictly for the purposes of job recruitment in' >> konrad_malawski_cv.txt
echo '            accordance with the regulationfor the protection of personal data passed on 29.08.97r. Dz.U nr 133 poz. 883.' >> konrad_malawski_cv.txt
