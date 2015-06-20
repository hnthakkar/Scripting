#!/usr/bin/python 

ref = __import__('5a')
import math
testCases = input()
for i in range(0,testCases):
    sides = raw_input();
    sideList = sides.strip(" ").split(' ');
    s1 = sideList[0]
    s2 = sideList[1]
    s3 = sideList[2]
    retValue = ref.is_satisfying_inequlaity(s1,s2,s3);
    print retValue;
    if(retValue==1):
        print ref.is_right_angled_triangle(s1,s2,s3);
        print ref.find_area_triangle(s1,s2,s3);
    
    
