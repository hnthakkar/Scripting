#!/usr/bin/python 
'''
a) Write a module file 5a.py which has below mentioned functions.
Function1: To check if the given three values satisfy the triangle inequality property.
Name: is_satisfying _inequality
Input: As function arguments, three values representing the triangle sides.
Output:Return-1 for invalid arguments(Inputs are not positive real numbers),0 if it is not triangle else 1.
Function2: To check if triangle is right angled triangle. (Assume all inputs are valid.)
Name: is_right_angled_triangle
Input: As function arguments, three values representing the triangle sides.
Output: Return 0 for false, 1 for true.
Function3: To find area of triangle. (Assume all inputs are valid.)
Name: find_area_triangle
Input: As function arguments, three values representing the triangle sides.
Output: Return area(integer value only without any rounding off). Use sqrt function from Math module
to calculate sqrt.
'''
import math
def is_satisfying_inequlaity(a,b,c):
	satisfy=0;
	try:
		if(int(a)<=0 or int(b)<=0 or int(c)<=0):
			return -1
		if(int(a)+int(b)>=int(c)):
			satisfy=1
		else:
			return 0
		if(int(b)+int(c)>=int(a)):
			satisfy=1
		else:
			return 0
		if(int(a)+int(c)>=int(b)):
			satisfy=1
		else:
			return 0
		
	except ValueError:
		return -1
	return satisfy
		

def is_right_angled_triangle(a,b,c):
	satisfy=0;
	if(int(a)>int(b) and int(a)>int(c)):
		if((int(a)*int(a))==((int(b)*int(b))+(int(c)*int(c)))):
			satisfy=1
	elif (int(b)>int(a) and int(b)>int(c)):
		if((int(b)*int(b))==((int(a)*int(a))+(int(c)*int(c)))):
			satisfy=1
	elif (int(c)>int(a) and int(c)>int(b)):
		if((int(c)*int(c))==((int(b)*int(b))+(int(a)*int(a)))):
			satisfy=1
	return satisfy

def find_area_triangle(a,b,c):
	s=(float(a)+float(b)+float(c))/2.0;
	return int(math.floor(math.sqrt(s*(s-float(a))*(s-float(b))*(s-float(c)))))
'''	
print is_satisfying_inequlaity(2,4,1);
print is_right_angled_triangle(2,4,1);
print is_satisfying_inequlaity(3,4,5);
print is_right_angled_triangle(3,4,5);
print find_area_triangle(3,4,5);

print find_area_triangle(3,4,5);
print find_area_triangle(3,3,5);
'''
	
