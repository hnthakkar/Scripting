#!/bin/bash

#This script find if a file is executable
# accepts the file name as a command line arguement

test -x $1       
 
if [ $? -eq 0 ] 
then 
  echo "YES"
else
  echo "NO"
fi	
exit 0
