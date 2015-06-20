#!/bin/bash

#This script does addition of two numbers

#x=$1
#y=$2

if [ $1 -eq $1 ] && [ $2 -eq $2 ] 
then 
  echo `expr $1 + $2`
else
  echo "Not a number"
fi
exit 0	

