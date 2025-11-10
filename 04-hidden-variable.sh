#!/bin/bash
 echo "please enter your PIN NUMBER" # prompt the user to enter their PIN number
 read -s PIN_NUMBER # echo` → Print messages   #`read` → Accept user input
                     #read -s` → Silent input (no echo on screen)
                    #-s is silent  read the user input and store it in the variable PIN_NUMBER
 echo "your PIN NUMBER is $PIN_NUMBER" # This prints the value the user entered