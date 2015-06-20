#!/bin/bash

#This script find if all are lower case alphabets only

x=$1
echo $1 | grep "^[a-z]\+$" > /dev/null       
 
if [ $? -eq 0 ] 
then 
   echo "YES"
else
   echo "NO"
fi	
exit 0
