#!/bin/bash

USERID=$(id -u) # prints the user id of current user
if [ $USERID -ne 0 ]; then
   echo  "You must run this script as root user."  
   exit 1
fi

VALIDATE COMMAND() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2 installation failed."
        #ACCORDING to our present code $2 is mysql ,mgodb,ngnix
        exit 1
    else 
        echo "$2 installed successfully."
    fi
}

dnf install nginx -y
VALIDATE COMMAND $? "Nginx" #without calling it will not execute here we called the validate function

dnf install mongodb-mongosh -y
VALIDATE COMMAND $? "Mongodb" #without calling it will not execute

dnf install mysql -y
VALIDATE COMMAND $? "Mysql"
# code optimized by using function to reduce repetation 