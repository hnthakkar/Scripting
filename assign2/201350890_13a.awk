#!/usr/bin/awk -f

{  c = ($0 - 32)*(5/9)
   print c
} 

