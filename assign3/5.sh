#!/bin/bash			
# This script finds all the file in a given directory 
# and if the file name contains all Alphabets only and 
# log_2.txt will contain the list of all deleted file along with timestamp

listFile()
{
        cd $1
	for dir in `find . -type d`; do
           dirName=$(echo $dir | sed -e 's/[[:space:]]/\\ /')
           cd $dirName
	   for file in `find . -maxdepth 1 -type f -atime -2 -regex './[a-zA-Z]+\.?[a-zA-Z]+' -printf "%f\n"`; do
	      lowerCase=`echo $file  | tr '[A-Z]' '[a-z]'`
	      if [ $lowerCase != $file ]; then
	        test -e $lowerCase      
 		if [ $? -eq 0 ]; then		
		   echo "File $lowerCase already exists. Skipping $file"
		   continue
  		else
     		    mv $file $lowerCase
 		fi
	    fi
	   done
           cd - >> /dev/null
        done
        cd - >> /dev/null
}

if [ $# == 1 ]
then
	test -d $1
	if [ $? -eq 0 ] 
	then
	    test -x $1
     	    if [ $? -eq 0 ]
	    then
	       listFile $1
            else
               echo "Error: Access denied!"  
	    fi 
	else
	    echo "Error: Invalid input!"
	fi
	    
else
	echo "Error: Invalid number of arguments!"
fi
exit 0


