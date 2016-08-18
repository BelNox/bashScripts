#!/bin/bash

# $1 path to file
# $2 - file name

cpvar=$1
cpvar+=$2

fileName=$(echo $2 | cut -d'.' -f 1)

scanDir="/home/micah/scripts/perl/nessus/scans/."
perlCmd="perl parse_nessus_xml.v21.pl -d scans/"
resultDir="/home/micah/scripts/bashScripts/folderLookout/results/"
ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if cp $cpvar $scanDir ; cd $scanDir; then
	echo "File ${2} copied"
	echo $2 >> "$ABSOLUTE_PATH/fileHistory.txt"

	if [[ "$(ls *.nessus -1 | wc -l)"=1 ]]; then
		mv $2 "$fileName.xlsx"
		cp "$fileName.xlsx" "$resultDir/."
		if rm "$fileName.xlsx";rm "$cpvar"; then
			echo "Files cleaned"
		fi
	else
		echo "Error - Too many .nessus files in the scans/ directory!"	
		touch "$resultDir/ErrorScanDir"
	fi

fi
