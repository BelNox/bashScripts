#! /bin/bash
WATCH_PATH=watched/
BUILD_SCRIPT=lib/build.sh

function runScript() {
	bash $BUILD_SCRIPT $1 $2
}

inotifywait -m --format '%f'  -e create $WATCH_PATH | while read FILE
do
	runScript $WATCH_PATH $FILE
done
