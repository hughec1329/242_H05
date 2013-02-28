#!/bin/sh
bzip2 -dc 1987.csv.bz2 # uncompress to stout
awk -F "," '{print $17}' samp.csv	# get just origin
grep LAX	# match airline
sc -l	# get # lines

cat samp.csv | awk -F "," '{print $17}'| grep 'LAX\|OAK\|SMF' | wc -l	# only gives total - need split by airport.

cat 1987.csv | awk -F "," '{print $17}'| grep 'LAX\|OAK\|SMF' | sort | uniq -c #DONE
