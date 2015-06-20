#!/usr/bin/python 
import math

while(1):
     value=raw_input();
     if(value != '-1'):
          isPalin = 1
          length = len(value)
          if(length > 2):
                  for i in range(0,(length-1)/2):
                          if(value[i]!= value[length-1-i]):
                                  isPalin=0
                                  break
          else:
                  if(value[0]!= value[1]):
                          isPalin=0
          if(isPalin==1):
               print('Yes')
          else:
               print('No')
     else:
                break
          
               
               
                    
               
               
     
