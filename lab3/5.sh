#!/bin/bash
# this script take any number of arguements, check if those are numneric value and give the max and min among them
# Input as command line arguement

maxMin()
{
   max=$1
   min=$1
   for var in $*
   do
   {  	
     #echo "echo $var"	
     if [ $var -ne $var ]
     then 
       echo "$var is NOT numeric." 
       exit 1
     else
     {
       if [ $max -lt $var ]
       then
          max=$var
       fi
       if [ $min -gt $var ]
       then
          min=$var
       fi    
     }
     fi
   }
   done
   echo "Max : $max"
   echo "Min : $min"  
}

maxMin $*
exit 0
