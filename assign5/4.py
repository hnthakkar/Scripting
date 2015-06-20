#!/usr/bin/python 
import sys
import os
import re

def directoryExists(targetDir):
    if not os.path.exists(targetDir):
        os.makedirs(targetDir)
    return

def itemList():
    items={}
    for line in sourceFile:
      item=re.split(':',line);
      if item[0] in items:
            items[item[0]]=int(items[item[0]])+ int(item[1]);
      else:
            items[item[0]]=int(item[1]);
    sourceFile.close()
    return items

def writeToFile(itemList):
    splitFile = open(targetDir + '/split.txt','w');
    charityFile = open(targetDir + '/charity.txt','w');
    itemTuple = sorted(itemList.items());
    for i in itemTuple:
      k=i[0]
      v=i[1]
      if int(v) % 2 == 0:
            splitFile.write("%s\n" % (k))
      else:
            charityFile.write("%s\n" % (k))
    splitFile.close()
    charityFile.close()

targetDir = sys.argv[2]
directoryExists(targetDir)
sourceFile = open(sys.argv[1],'r');
itemList = itemList()
writeToFile(itemList)

                  

            
    














