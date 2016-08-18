#! /bin/bash
WATCH_PATH="/home/micah/scripts/bashScripts/folderLookout/excel/"
INIT_NESSUS=lib/initNessus.sh

function runScript() {
	bash $INIT_NESSUS $1 $2
}

inotifywait -m --format '%f'  -e create $WATCH_PATH | while read FILE
do
	echo
	if [[ "$(echo $FILE | cut -d'.' -f 2)" == "nessus" ]]
	then
		echo "Nessus file detected"
		if (runScript $WATCH_PATH $FILE) ; then
			echo "Success"
		else
			echo "Failed"
		fi
	else
		echo "Not a nessus file"
		
	fi
done
