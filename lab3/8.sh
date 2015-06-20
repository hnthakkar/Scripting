#!/bin/bash
# this script prints a diamond for a given number

printSpace()
{
  i=1
  while [ $i -le $1 ]
  do
  printf '%s' " "
  i=$(( $i + 1 ))
  done
}

printStar()
{
  j=1
  while [ $j -le $1 ]
  do
  printf '%s' "*"
  j=$(( $j + 1 ))
  done
  printf '\n'
}

star=1
space=$(( $1 - 1 ))
line=$1
#echo $star
#echo $space

for ((a=1; a<=line; a+=1))
do
#printSpace $space
printStar $star
space=$(( $space - 1 ))
star=$(( $star + 2 ))
done

line=$(( $1 - 2 ))
star=$(( $star - 4 ))
space=1 
for ((a=line; a>=0; a-=1))
do
#printSpace $space
printStar $star
space=$(( $space + 1 ))
star=$(( $star - 2 ))
done
exit 0

	
