#!/bin/bash
#everyhting in shell is considered as string
NUMBER1=100 #here 100 is also taken as string or text
NUMBER2=200
NAME=HARIKA #here HARIKA is also taken as string or text
 #arthemetic operation should be done inside double parenthesis
SUM=$((NUMBER1 + NUMBER2+NAME)) #name is string so it will be considered as 0
#suppose SUM=$((NUMBER1 + NAME )) then it will be considered as 100+0=100
#SUM=$((string + number1)) error will be thrown

echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"

LEADERS="gandhi, mandela, martin luther king jr, jawaharlal nehru"
#to get number of characters in a string
echo "Number of characters in LEADERS string is: ${#LEADERS}"

PEOPLE=("gandhi" "mandela" "martin luther king jr" "jawaharlal nehru")
#to get number of elements in an array
echo "Number of elements in PEOPLE array is: ${#PEOPLE[@]}"

