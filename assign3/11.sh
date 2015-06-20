#!/bin/bash

if [ $# -eq 0 ]; then 
   echo "Error: Invalid number of arguments!";
   exit 1
else
   envVar=$(echo $TRASH_DIR)
   if [ -z $envVar ]; then
      echo "Error : Env Variable TRASH_DIR is not set"
   else
     for dirs in $@
     do
       echo $dirs|grep "^TRASH_DIR="
       if [ $? -eq 0 ];then
          pathname=$(echo $dirs|sed -n 's/TRASH_DIR=//gp')
          cp -R $TRASH_DIR/* $pathname/ 2>/dev/null
          TRASH_DIR=$pathname
          export TRASH_DIR
       else
          compressFiles $dirs
          if [ -w $dirs ]; then
             filename=$(basename $dirs)
             tar --remove-files -cvf $dirs/$filename.tar $dirs/*
             gzip $dirs/$filename.tar
          else
             echo "Error: Invalid Folder!"
          fi
          mv $dirs $TRASH_DIR/ 2>/dev/null
       fi
     done
   fi
fi

