#!/bin/bash
R="\e[31m" # Red color
G="\e[32m" # Green color
Y="\e[0;33m" # Yellow color]
B="\e[1;33M" # Bold Yellow color
O="\e[1;34m" # Bold Blue color
N="\e[0m"  # No Color


USERID=$(id -u) # prints the user id of current user
if [ $USERID -ne 0 ]; then
   echo  -e " $R You must run this script as root user."  #i forgot ot add -e check it 
   exit 1
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

dnf install nginx -y
VALIDATECOMMAND $? "Nginx" #without calling it will not execute here we called the validate function


dnf install mysql -y
VALIDATECOMMAND $? "Mysql"
#ealier i gave mysql at last as mangobd couldnt install it have stopped there only mysql is also not installed so now i changed mysql in middle it have executed

dnf install python3 -y
VALIDATECOMMAND $? "python3"

dnf install mongodb-mongosh -y
VALIDATECOMMAND $? "Mongodb" #without calling it will not execute
#mangodb is not excuted because we didnt add mangodb repository


 