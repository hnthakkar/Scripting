#!/bin/bash

#This script prints the nth prime number

x=$1

nPrime()
{
  if [ $1 -eq 1 ]
  then
     echo "2"
     exit 0
  elif [ $1 -eq 2 ]
  then
     echo "3"
     exit 0
  fi

  number=4
  primeCount=2
  #echo "$1"
  while [ $primeCount -lt $1 ]
  do
  {
     #checkTill=`expr $number / 2`
     i=2
     isPrime=0
     while [ $i -lt $number ]
     do
     {
        rem=`expr $number % $i`
        #echo "$number % $i is : $rem"
        if [ $rem -eq 0 ]
        then
        {
           isPrime=1
           break
           #echo $isPrime
        }
        else
           i=$(( $i + 1 ))
        fi
     }
     done
     #echo "Is $number prime : $isPrime"
     number=$(( $number + 1 ))
  
     if [ $isPrime -eq 0 ] 
     then
        #echo "$primeCount"
        primeCount=$(( $primeCount + 1 ))
     fi
   }
   done
   echo "$(( $number - 1))"
   exit 0
}


if [ $x -eq $x ]
then 
  nPrime $x
fi	
exit 0
