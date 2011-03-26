#!/bin/sh
rm *~
rm *.lg
rm *.log
rm *.idv
rm *.dvi
rm -rf _site
rm *.orig

if [ "$1" == 'all' ]; then
  rm *.pdf
  rm *.txt
fi
