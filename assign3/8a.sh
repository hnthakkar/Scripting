#!/bin/bash			

strlen()
{
   #expr length $1
   str=$1
   counter=0
   while(true)
   do
      if [[ -n $str ]] ; then
       str=$(echo "$str" | sed -e 's/.//')
       counter=$(( $counter+1 ))
      else
        break;
      fi
   done
   #echo "$counter"  
   echo $(( $counter ))   
}

strcat()
{
   echo "$1$2"
   #echo $(( $1$2 ))    
}

strcmp()
{
   local s1="$1"
   local s2="$2"
   if [ "$s1" = "$s2" ] ; then
      echo $(( 0 ))
   fi

   if [ "$s1" '>' "$s2" ] ; then
      echo $(( 1 ))
   fi

   if [ "$s1" '<' "$s2" ] ; then
      echo $(( -1 ))
   fi  
}

strtok()
{
   #echo $1 $2
   str=$1
   delimiter=$2
   value=$(echo "$str" | sed -e 's/['${delimiter}']/\n/g' -e '/^$/d' | head -1)
   echo $value
   #echo $value
   #echo "in strtok func : $1  $2"   
}

strstr()
{
   str=$1
   str2=$2
   value=$(echo "$str" | sed -e 's/\(.*\)\('${str2}'\)\(.*\)/\2\3/')
   echo $value   
}


