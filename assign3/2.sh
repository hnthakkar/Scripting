#!/bin/bash			
# This script finds all the file in a given directory of size greater than 100k one by one
# and gives an option to delete or compress the file
# log_2.txt will contain the list of all deleted file along with timestamp

listFile()
{
	#fileList=$(find $1 -type f -size +10k -exec ls {} \+)
	#echo "file List : "$fileList
	#for file in "${fileList[@]}"; do
	for file in `find "$1" -type f -size +10k`; do
	    #echo "$file"
	    read -p "Press 'd' to Delete or 'c' to compress file : $file?" opt
	    
	    case $opt in
    		[dD]*) echo $file  $(date) >> log_2.txt;rm -rf $file;continue;;
		[cC]*) tar -zcf "$file.tar.gz" $file; continue;;
	    esac
	done
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


