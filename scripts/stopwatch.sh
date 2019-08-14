#!/bin/bash
#
# Use to print out how long a command takes
# Usage: time.sh "sleep 5"
#

now=$(date +%s)sec
$1
printf "%s" $(TZ=UTC date --date now-$now +%H:%M:%S.%N)
