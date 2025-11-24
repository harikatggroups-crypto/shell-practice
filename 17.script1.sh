#!/bin/bash

NAME=harika
echo "my name is $NAME"
echo " PID of the script is $$"
#sh 18.script2.sh   # iam calling script 2 in  script 1
source 18.script2.sh  # source command will bring all the variables and functions of script2 to script1
