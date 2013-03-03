#!/bin/bash
com=`awk -F ',' '{if ($17 == /$3 ) s+=$15} END {print s}'` 
echo "this is the command" $com
