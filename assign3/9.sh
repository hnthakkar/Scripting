#!/bin/bash

if [ $# -eq 5 ]
then 
    if [ -e "$2" ];then
        filename=$1_$3.tar.gz
        #echo $filename
        tarfilename=$(basename $2)
        if [ $filename == $tarfilename ];then
           tar -xf $2
           if [ $? -ne 0 ];then
               echo "Error: In extracting tar File"
               exit 1        
           else
              filename=$1_$4
              #echo "2nd : $filename"
              if [ -e $filename ];then
                 filename=$1_$4
                 filepattern=$5
                 extrafiles=$(ls $filename| grep -v "$filepattern$"|wc -l)
                 if [ $extrafiles -ne 0 ]; then
                     echo "Error: Internal file invalid format"
                     exit 1
                 else
                     echo "Good one"
                 fi
              else
                 echo "Error: Invalid Folder Name"
                 exit 1
              fi
           fi
        else
           echo "Error: Invalid Tar Name"
           exit 1
        fi
    else
       echo "Error: Invalid tar path"
       exit 1
    fi
else
    echo "Error: Usage: bash Validations.sh <Rollno> <TarPath> <Tar pattern> <Inside folder pattern> <Inside file format file>"
    exit 1
fi
exit 0

