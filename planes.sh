#!/bin/sh
bzip2 -dc 1987.csv.bz2 # uncompress to stout
awk -F "," '{print $17}' samp.csv	# get just origin
grep LAX	# match airline
sc -l	# get # lines

cat samp.csv | awk -F "," '{print $17}'| grep 'LAX\|OAK\|SMF' | wc -l	# only gives total - need split by airport.

cat 1987.csv | awk -F "," '{print $17}'| grep 'LAX\|OAK\|SMF' | sort | uniq -c #DONE

time bzip2 -dc 1987.csv.bz2 | awk -F "," '{print $17}'| grep 'LAX\|OAK\|SMF' | sort | uniq -c	# to time it.

cat ~/data/airports/open/1987.csv | awk -F ',' '{print $17}'| grep -E 'LAX|OAK|SMF|SFO' | awk -F ',' '{s+=$15} END {print s}' |

cat ~/data/airports/open/1987.csv | awk -F ',' '{s+=$15} END {print s}' # to get sum, but need only those from lax etc.

cat ~/data/airports/open/1987.csv | awk -F ',' '{if ($17 == "LAX"||$17 == "OAK") s+=$15} END {print s}'	# working but this is sum of all airports - need to do one at a time - no way to combine?

 cat ~/data/airports/open/1987.csv | awk -F ',' '{if ($17 == "LAX") l+=$15; else if ($17 == "OAK") o+=$15 } END {print l,o}'	# can get multiple out.


