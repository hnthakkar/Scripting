#!/bin/bash

#This script find if a file exists or not
# accepts the file name as a command line arguement
test -e $1      
 
if [ $? -eq 0 ] 
then 
  echo "YES"
else
  echo "NO"
fi	
exit 0
