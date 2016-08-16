#! /bin/bash
WATCH_PATH=watched/
BUILD_SCRIPT=lib/build.sh
INIT_NESSUS=lib/initNessus.sh

function runScript() {
	bash $INIT_NESSUS $1 $2
}

inotifywait -m --format '%f'  -e create $WATCH_PATH | while read FILE
do
	if (runScript $WATCH_PATH $FILE) ; then
		echo "Success"
	else
		echo "Failed"
	fi
done
