#!/bin/bash

set -e

if [[ $1 == "" || $2 == "" || $3 == "" ]]; then
    echo 'Usage: ./linux.sh "Window Title" [width] [height]'
    exit 1
fi

DIMS=$(xdpyinfo | grep 'dimensions: ' | sed -E -e 's/\s+dimensions:\s+([0-9]+)x([0-9]+)\s+.*/\1 \2/')

WIDTH=$(echo "$DIMS" | sed -E -e 's/\s[0-9]+$//')
HEIGHT=$(echo "$DIMS" | sed -E -e 's/^[0-9]+\s//')

LEFT=$(( ($WIDTH - $2) / 2 ))
TOP=$(( ($HEIGHT - $3) / 2 ))

wmctrl -r "$1" -e 0,$LEFT,$TOP,$2,$3
