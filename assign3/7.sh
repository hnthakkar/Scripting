#!/bin/bash			

listFile()
{
     for element in $@; do
        for dir in `find $element -type d`; do	
	  #echo $dir
	  cd $dir
          echo "$dir:"
	  for file in `find . -maxdepth 1 -printf "%f\n"`; do
	    if [ $file == . ] ; then
   		continue
            fi
	    echo -n "$file   "
	  done
          echo -e "\n"
          cd - >> /dev/null
        done
     done
}

if [ $# == 0 ]
then
    listFile .
else
    listFile $@
fi
exit 0


