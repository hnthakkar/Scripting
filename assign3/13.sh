#!/bin/bash			

function customerReview
{
    for custID in `cat $1 | awk '{print $3}' | sort -n | uniq`
    do
      #echo "Outer Cust : $custID"
      pcount=0
      ncount=0
      while read innerline
      do
        #echo "Inner line : $innerline"
        #echo $line | awk 'match($1,$line) == 1 {count=$(( $count+1 ))}'
        innerCustID=$(echo $innerline | awk '{print $3}' ) 
        #echo "Inner Cust : $innerCustID"
        if [ $innerCustID == $custID ]; then
           #echo $innerline
           review=$(echo $innerline | awk '{print $5}' ) 
           #echo $review
           if [ $review == "P" ]; then
              pcount=$(( $pcount+1 ))
           elif [ $review == "N" ]; then
              ncount=$(( $ncount+1 ))
           fi
        fi
      done < $1
      echo "$custID $pcount $ncount" >> 201350890_PNR.txt
    done
}

function productReview
{
    for productID in `cat $1 | awk '{print $2}' | sort -n | uniq`
    do
      #echo "Outer Cust : $custID"
      pcount=0
      ncount=0
      while read innerline
      do
        #echo "Inner line : $innerline"
        #echo $line | awk 'match($1,$line) == 1 {count=$(( $count+1 ))}'
        innerProductID=$(echo $innerline | awk '{print $2}' ) 
        #echo "Inner Cust : $innerCustID"
        if [ $innerProductID == $productID ]; then
           #echo $innerline
           review=$(echo $innerline | awk '{print $5}' ) 
           #echo $review
           if [ $review == "P" ]; then
              pcount=$(( $pcount+1 ))
           elif [ $review == "N" ]; then
              ncount=$(( $ncount+1 ))
           fi
        fi
      done < $1
      echo "$productID $pcount $ncount" >> 201350890_PRC.txt
    done
}

function maxNReview
{
    maxNCount=0
    maxStartTime=0
    maxEndTime=0
    startTime=0
    endTime=0
    count=0
    while read line
    do
       review=$(echo $line | awk '{print $5}')
       #echo "review : $review"
       if [ $review == "N" ]; then
          if [ $count -eq 0 ]; then
             startTime=$(echo $line | awk '{print $4}' )
             #echo "startTime : $startTime" 
             count=1
             #echo "first N"
          else
             endTime=$(echo $line | awk '{print $4}' )
             count=$(( $count+1 ))
          fi
       elif [ $review == "P" ] && [ $count -gt 0 ]; then
            if [ $count -gt $maxNCount ]; then
               #echo "count greater"
               maxNCount=$count
               maxStartTime=$startTime
               maxEndTime=$endTime
               #echo "max : $maxStartTime"
            fi
            startTime=0
            endTime=0
            count=0 
       fi
    done < $1
    echo "``$(date +'%d-%m-%Y %H:%M:%S' -d @$maxStartTime) : $( date +'%d-%m-%Y %H:%M:%S' -d @$maxEndTime)" 
}

if [ $# -gt 0 ]
then
   for element in $@; do
      test -x $element
      if [ $? -eq 0 ] 
      then
	  customerReview $element
          productReview $element
          maxNReview $element
      else
          echo "Error: Access denied!"  
      fi 
  done
else
  echo "Error: Invalid number of arguments!"
fi
exit 0



