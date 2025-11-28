

#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 #normally in projects we use 75
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
MESSAGE=""
while IFS= read -r line  #IFS internal field seperator
                         #IFS= ',' read name age <<< harika,27  then output lo coma deggara slipt aitadi #its separated by ,”.  
do

  USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
  PARTITION=$(echo $line | awk '{print $7}')  

   if [ $USAGE -ge $DISK_THRESHOLD ]; then
      MESSAGE="Alert: High Disk Usage on $PARTITION: $USAGE%"
   fi
      
done <<< "$DISK_USAGE" # "<<<" string	Read input from a string
                           #👉 Take the content stored in $DISK_USAGE

echo "message Body: $MESSAGE"                     