#!/bin/bash			
# This script finds print 6 place natural logarithm between 1.0 to 100.0 in steps of 0.1

start=1.0
while(true)
do
   logValue=$(echo l\($start\) | bc -l)
   printf "%s    %f\n" $start $logValue
   start=$(bc <<< "$start+0.1")
   if [ $(echo "100.0 < $start" | bc) -ne 0 ]
   then
	break
   fi 
done
exit 0


