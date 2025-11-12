#!/bin/bash

USERID =$(id -u) # prints the user id of current user
if [ $USERID -ne 0 ]; then
    echo "You must run this script as root user."
    exit 1
fi

dnf install ngnix -y

if [ $? -ne 0 ]; then
    echo "error : Nginx installation failed."
    exit 1
else 
    echo "Nginx installed successfully."
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "error : Mongodb installation failed."
    exit 1
else 
    echo "Mongodb installed successfully."
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "error : Mysql installation failed."
    exit 1
else 
    echo "Mysql installed successfully."
fi  