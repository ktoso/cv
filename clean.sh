#!/bin/sh
rm *~
rm *.lg
rm *.log
rm *.idv
rm *.dvi

if [$1 == 'all'] then
  rm *.pdf
  rm *.txt
fi
