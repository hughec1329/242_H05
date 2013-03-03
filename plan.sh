#!/bin/bash
# How to pass in airline names as argument to script?
case "$1" in
	count)
		lax=`cat $2 | awk -F ',' '{if ($17 == "LAX" ) s+=$15} END {print s}'`
		oak=`cat $2 | awk -F ',' '{if ($17 == "OAK" ) s+=$15} END {print s}'`
		smf=`cat $2 | awk -F ',' '{if ($17 == "SMF" ) s+=$15} END {print s}'`
		sfo=`cat $2 | awk -F ',' '{if ($17 == "SFO" ) s+=$15} END {print s}'`
		echo "lax" $lax
		echo "oak" $oak
		echo "smf" $smf
		echo "sfo" $sfo
		;;
	mean)
		lax=`cat $2 | awk -F ',' '{if ($17 == "LAX" ) {sum+=$15;nrec+=1}} END {print sum/nrec}'`
		oak=`cat $2 | awk -F ',' '{if ($17 == "OAK" ) {sum+=$15;nrec+=1}} END {print sum/nrec}'`
		smf=`cat $2 | awk -F ',' '{if ($17 == "SMF" ) {sum+=$15;nrec+=1}} END {print sum/nrec}'`
		sfo=`cat $2 | awk -F ',' '{if ($17 == "SFO" ) {sum+=$15;nrec+=1}} END {print sum/nrec}'`
		echo "lax" $lax
		echo "oak" $oak
		echo "smf" $smf
		echo "sfo" $sfo
		;;
	sd)
		lax=`cat $2 | awk -F ',' '{if ($17 == "LAX" ) {sum+=$15;nrec+=1;array[nrec]=$15}} END {for(x=1;x<=nrec;x++) sumsq+=(array[x]-(sum/nrec))^2 ; print sqrt(sumsq/nrec)}'`
		oak=`cat $2 | awk -F ',' '{if ($17 == "OAK" ) {sum+=$15;nrec+=1;array[nrec]=$15}} END {for(x=1;x<=nrec;x++) sumsq+=(array[x]-(sum/nrec))^2 ; print sqrt(sumsq/nrec)}'`
		smf=`cat $2 | awk -F ',' '{if ($17 == "SMF" ) {sum+=$15;nrec+=1;array[nrec]=$15}} END {for(x=1;x<=nrec;x++) sumsq+=(array[x]-(sum/nrec))^2 ; print sqrt(sumsq/nrec)}'`
		sfo=`cat $2 | awk -F ',' '{if ($17 == "SFO" ) {sum+=$15;nrec+=1;array[nrec]=$15}} END {for(x=1;x<=nrec;x++) sumsq+=(array[x]-(sum/nrec))^2 ; print sqrt(sumsq/nrec)}'`
		echo "lax" $lax
		echo "oak" $oak
		echo "smf" $smf
		echo "sfo" $sfo
		;;
esac
