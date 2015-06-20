#!/bin/bash

#This script find if all the charater are numeric value or not

echo $1 | grep "^[0-9]\+$" > /dev/null       
 
#if [ $1 -eq $1 ] 
if [ $? -eq 0 ] 
then 
   echo "YES"
else
   echo "NO"
fi	
exit 0
