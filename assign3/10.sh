#!/bin/bash

function convertToSeconds
{
    time=0
    IFS=':' read -a arr <<< "$1"
    length=${#arr[@]}
    total=0 
    for ((i=$(( $length-1 ));i>=0;i-=1))
    do   
	total=$(( $total+${arr[$i]} ))
    done
    echo $(( $total ))
}

function getLongestStreak
{
    #echo "getLongestStreak called : $1"
    TURN_ON=0
    TURN_OFF=0
    MAX_DIFF=0
    while read line
    do
       if [ $TURN_ON == 0 ]; then
          TURN_ON=$line
          #echo "TURN_ON : $TURN_ON "
       else 
          TURN_OFF=$line
          #echo "TURN_OFF : $TURN_OFF" 
          DIFF=$(( $TURN_OFF - $TURN_ON ))
          if [ $DIFF -gt $MAX_DIFF ]; then	       
	     MAX_DIFF=$DIFF
          fi
          TURN_ON=0
       fi
    done < $1
    echo "$2:$MAX_DIFF"
}

function getLongestStreakForAll
{
    #pwd
    cd $1
    for dir in `find . -maxdepth 1 -type d`; do		
        #echo "getLongestStreakForAll : $dir"
        if [ $dir == . ] ; then
   	   continue
        fi
	#pwd
        cd $dir
        #pwd
        directory=$(echo "$dir" | sed -e 's/.\///')
        filename="BootLog_$directory.txt"
        #echo $filename
        test -e $filename
        if [ $? -eq 0 ]
        then
            #echo "calling" 
            getLongestStreak $filename $directory
        fi
        cd - >> /dev/null   
    done
    cd - >> /dev/null
}

if [ $# > 0 ]
then
	for element in $@; do
        #echo "outside : $element"
        test -d $element
	if [ $? -eq 0 ] 
	then
	    test -x $1
     	    if [ $? -eq 0 ]
	    then
               #echo "calling"
	       getLongestStreakForAll $element
            else
               echo "Error: Access denied!"  
	    fi 
	else
	    echo "Error: Invalid $element!"
	fi
        done
	    
else
	echo "Error: Invalid number of arguments!"
fi
exit 0




