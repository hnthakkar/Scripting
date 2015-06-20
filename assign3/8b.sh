#!/bin/bash			

callStrFunc()
{
     source ./8a.sh
     echo `strcmp $1 $2`	
     echo `strlen $1`
     echo `strlen $2`
     echo `strcat $1 $2`
     echo `strtok $1 $2`
     echo `strstr $1 $2`
}

if [ $# == 2 ]
then
    callStrFunc $@
else
    echo "Error: Invalid number of arguments!"
fi
exit 0


