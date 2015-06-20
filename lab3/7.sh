#!/bin/bash
fibonacci()
{
  num1=0
  num2=1
  
  if [ $1 -eq 0 ]
  then
     echo "$num1"  
     exit 0
  elif [ $1 -eq 1 ]
  then
     echo "$num2"  
     exit 0
  else
  {
  i=3
  while [ $i -le $1 ]
  do
  {
    tmp=$(( $num1 + $num2 ))
    num1=$num2
    num2=$tmp
    i=$(( $i+1 ))
  }
  done
  echo "$num2"
  exit 0
  }
  fi
}
fibonacci $1
exit 0


