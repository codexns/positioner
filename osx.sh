#!/bin/bash

set -e

if [[ $1 == "" || $2 == "" || $3 == "" ]]; then
    echo 'Usage: ./osx.sh "Application Name" [width] [height]'
    exit 1
fi

DIMS=$(system_profiler SPDisplaysDataType | grep Resolution | sed -E -e 's/^ +Resolution: ([0-9]+) x ([0-9]+)/\1 \2/')

WIDTH=$(echo "$DIMS" | sed -E -e 's/ [0-9]+$//')
HEIGHT=$(echo "$DIMS" | sed -E -e 's/^[0-9]+ //')

LEFT=$(( ($WIDTH - $2) / 2 ))
TOP=$(( ($HEIGHT - $3) / 2 ))

osascript<<END
tell application "System Events"
	set position of first window of application process "$1" to {$LEFT, $TOP}
	set size of first window of application process "$1" to {$2, $3}
end tell
END
