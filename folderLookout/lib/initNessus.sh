#!/bin/bash

# $1 - path to file
# $2 - file name

cpvar=$1
cpvar+=$2

scanDir="/home/micah/scripts/perl/nessus/scans/."
perlCmd="perl parse_nessus_xml.v21.pl -d scans/"
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if cp $cpvar $scanDir ; cd $scanDir; then
	echo "File ${2} copied"
	echo $2 >> "$ABSOLUTE_PATH/fileHistory.txt"
	numFiles="$(ls -1 | wc -l)"	
	
	if [[ $numFiles = "1" ]] then		
		BASENAME="$(basename "*.nessus" ".nessus")"
		echo $BASENAME
		mv "*.nessus" "$BASENAME'.xlsx'"
		cp "*.xlsx" "$ABSOLUTE_PATH/../results/."
	else
		echo "Error - Too many .nessus files in the scans/ directory!"	
	

	fi

fi
