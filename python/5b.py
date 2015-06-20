#!/usr/bin/python 

#from str(5a) import *
my = __import__('5a')
#import *
#from . import *
'''
b) Write a file that uses the above module file. Name this file as 5b.py
Input:
Line1-> No of Testcases(tc)(No need to validate it)
Line2-> Three sides of traingle1 separated by one space.
Line3....tc+1-> Three sides of traingle2... separated by one space.
Ouput:
For each line of testcase,
Call function1. Print its output in a line.
If function1 returns 1 i.e. it forms a triangle, call function2 and print its output, else dont call and dont
print anything.
If function1 returns 1 i.e. it forms a triangle, call function3 and print its output, else dont call and dont
print anything.
Sample Input:
2
1 2 5
3 3 5
Sample Output:
0
1
0
4
'''
import math
test=input()
for t in range(0,test):
	sides=raw_input();
	l=sides.split();
	#print l
	r1=my.is_satisfying_inequlaity(l[0],l[1],l[2]);
	print r1;
	if(r1==1):
		print my.is_right_angled_triangle(l[0],l[1],l[2]);
	if(r1==1):
		print my.find_area_triangle(l[0],l[1],l[2]);
	
	
