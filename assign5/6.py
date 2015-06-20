#!/usr/bin/python 
import sys
import os
import re
import stat

inputFile = sys.argv[1];
if(not os.path.exists(inputFile) or os.stat(inputFile)[stat.ST_SIZE]==0):
    print 'Chai Not found!'
else:
    fileRef = open(inputFile,'r')
    lines = fileRef.readlines()
    count = 0
    minDistance = sys.maxint
    chotiWaliAtMin = sys.maxint
    badiWaliAtMin = sys.maxint
    canteenName = ""
    for line in lines:
        params = re.split(',',line)
        params[1] = int(params[1])
        params[2] = int(params[2])
        params[3] = int(params[3])
        if(minDistance > params[1]):
            canteenName = params[0]    
            minDistance = params[1]
            chotiWaliAtMin = params[2]
            badiWaliAtMin = params[3]
            count = 1
            continue
        elif(minDistance == params[1]):
            if(chotiWaliAtMin > params[2]):
                canteenName = params[0]    
                minDistance = params[1]
                chotiWaliAtMin = params[2]
                badiWaliAtMin = params[3]
                count = 1
                continue
            elif(chotiWaliAtMin == params[2]):
                if(badiWaliAtMin > params[3]):
                    canteenName = params[0]    
                    minDistance = params[1]
                    chotiWaliAtMin = params[2]
                    badiWaliAtMin = params[3]
                    count = 1
                    continue
                elif(badiWaliAtMin == params[3]):
                    count = count + 1
    fileRef.close()
    if(count == 1):
        print canteenName
    else:
        print "CCD"
        
    

        
    
            
            
        
