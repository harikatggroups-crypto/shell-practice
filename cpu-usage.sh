#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 #normally in projects we use 75

while IFS=',' read -r line  #IFS internal field seperator
#IFS= ',' read -r line #its separated by ,”.  
do
    echo "$line"
done <<< "$DISK_USAGE" # "<<<" string	Read input from a string
#👉 Take the content stored in $DISK_USAGE