

#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 #normally in projects we use 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) #-s to silent and not ot print on terminal for clean look
MESSAGE=""
while IFS= read -r line  #IFS internal field seperator
                         #IFS= ',' read name age <<< harika,27  then output lo coma deggara slipt aitadi #its separated by ,”.  
do

  USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
  PARTITION=$(echo $line | awk '{print $7}')  

   if [ $USAGE -ge $DISK_THRESHOLD ]; then
      MESSAGE+="Alert: High Disk Usage on $PARTITION: $USAGE% \n" #\n new line la kakunda normal text laaga treat chesthundi so -e is added near message
   fi
      
done <<< "$DISK_USAGE" # "<<<" string	Read input from a string
                           #👉 Take the content stored in $DISK_USAGE

echo -e "message Body: $MESSAGE" # -e to get /n as next line 

sh 22.mail.sh "harikadharavath987@gmail.com" "High Disk Usage alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"


#TO_ADDRESS=$1
#SUBJECT=$2
#ALERT_TYPE=$3
#MESSAGE_BODY=$4
#IP_ADDRESS=$5
#TO_TEAM=$6