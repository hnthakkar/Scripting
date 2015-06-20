#!/bin/bash			
# This script finds the main memory usage in 

#free -m | awk 'match($1,"Mem:") == 1 {print $3}'

memoryUsage()
{
   timeIntervalCount=0
   maxInInterval=0
   minInInterval=`free -m | awk 'match($1,"Mem:") == 1 {print $2}'`
   avgOfInterval=0
   totalInInterval=0
   numberOfIntervals=$(( $2/$1 ))
   #echo $numberOfIntervals
   while(true)
   do
	#echo `free -m | awk 'match($1,"Mem:") == 1 {print $3}'`
        mem=`free -m | awk 'match($1,"Mem:") == 1 {print $3}'`
	timeIntervalCount=$(( $timeIntervalCount+1 ))	
	if [ $mem -gt $maxInInterval ]; then
	    maxInInterval=$mem
	fi
        if [ $mem -lt $minInInterval ]; then
            minInInterval=$mem
        fi
	totalInInterval=$(( $totalInInterval+$mem ))
        avgOfInterval=$(( $totalInInterval/$timeIntervalCount ))
        #echo "Avg : $avgOfInterval"
        #echo "Mem : $mem"
        #echo "time interval count : $timeIntervalCount"
	
	test $timeIntervalCount -ge $numberOfIntervals
	#echo "value : $?"
	if [ $? -eq 0 ]; then
	     echo "$(date +%m-%d-%T)-Peak:$maxInInterval,Lowest:$minInInterval,Average:$avgOfInterval" >> Log_6.txt
	     #echo ""
	     #echo "Avg Int: $avgOfInterval"
	     timeIntervalCount=0
   	     maxInInterval=0
   	     minInInterval=`free -m | awk 'match($1,"Mem:") == 1 {print $2}'`
   	     avgOfInterval=0
   	     totalInInterval=0
   	fi
		
	sleep $1
   done
}

if [ $# == 2 ]
then
	if [ $1 -eq $1 ] && [ $2 -eq $2 ]  
	then
	    memoryUsage $@
        else
            echo "Error: Invalid input!"
	fi
	    
else
	echo "Error: Invalid number of arguments!"
fi
exit 0

