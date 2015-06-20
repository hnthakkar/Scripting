#!/usr/bin/python 
import math
def is_satisfying_inequlaity(s1,s2,s3):
    try:
        x = int(s1)
        y = int(s2)
        z = int(s3)
        if(x <= 0 or y <= 0 or z <= 0):
            return -1
        if( (x + y >= z) and (y + z >= x) and (x + z >= y)):
            return 1
        else:
            return 0
    except ValueError:
        return -1
    
        

def is_right_angled_triangle(s1,s2,s3):
    x = int(s1)
    y = int(s2)
    z = int(s3)
    if(x > y):
        if(x > z):
            if(x*x == y*y + z*z):
                return 1
        elif(z*z == x*x + y*y):
            return 1
    elif(y > z):
        if(y*y == z*z + x*x):
            return 1
        elif(z*z == x*x + y*y):
            return 1
    return 0
    
def find_area_triangle(s1,s2,s3):
    sumOfSides=(float(s1)+float(s2)+float(s3))/2.0;
    return int(math.sqrt(sumOfSides*(sumOfSides-float(s1))*(sumOfSides-float(s2))*(sumOfSides-float(s3))))
    
