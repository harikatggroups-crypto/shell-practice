#!/bin/bash

R="\e[31m" # Red color
G="\e[32m" # Green color
Y="\e[0;33m" # Yellow color]
B="\e[1;33M" # Bold Yellow color
O="\e[1;34m" # Bold Blue color
N="\e[0m"  # No Color

LOGS_FOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo -e "$G script started executed at : $(date) $N" | tee -a $LOG_FILE #tee lets you see the output on the screen while also saving it to a file.

USERID=$(id -u) # prints the user id of current user
if [ $USERID -ne 0 ]; then
   echo  -e " $R You must run this script as root user."  #i forgot ot add -e check it 
   exit 1 #other than 0 take it as failure ''
fi

VALIDATECOMMAND(){ #no space should be between validate command and ()
    if [ $1 -ne 0 ]; then
        echo -e "$B Error: $2 installation failed."
        #ACCORDING to our present code $2 is mysql ,mgodb,ngnix
        exit 1
        

    else 
        echo -e "$O $2 installed successfully."
    fi
}

for package in $@ # $@ will take all the arguments passed to the script
do
 dnf list installed $package &>>$LOG_FILE  #The command to list all installed packages using DNF
   #if exit status is 0 means package already installed if ne 0 means not installed
if [ $? -ne 0 ]; then
    dnf install $package -y &>>$LOG_FILE #installing the package
    VALIDATECOMMAND $? "$package" #calling the function to validate installation// Validate if install succeeded
else
    echo -e "$Y $package is already installed. Skipping installation."
fi
done