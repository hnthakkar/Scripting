#!/bin/bash			
# This script finds the sum of all four digit numbers
# containing exactly two repetition of digit among {6,7,8} 

sum=0
for (( i=1000;i<=9999;i++ )) 
do
   len=$(echo $i | sed -e 's/[6-8]//' -e 's/[6-8]//' -e 's/[6-8]//' | awk '{print length}')
   if [ $len -eq 2 ];
   then
	#echo $i
	sum=$(( $i+$sum ))
   fi
done
echo $sum
exit 0


