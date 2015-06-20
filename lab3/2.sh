#!/bin/bash

#This script writes the table of a given number

x=$1

genTable()
{
  for i in {1..10}; do
    echo `expr $i \* $1`
  done
}

if [ $x -eq $x ]
then 
  genTable $x
else
  echo "Not a number"
fi	
exit 0
