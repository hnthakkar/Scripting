#!/usr/bin/python 
'''
2.
Write a python script that does the division of the given two command line arguments.
If Number of Input arguments!=2, raise "IndexError" and in handle of this particular error, print
Invalid No of Arguments
If Inputs are not numeric, manually raise "TypeError" and in handle of this particular error, print
Invalid Type of Arguments
If second argument is 0, manually raise "ZeroDivisionError" and in handle of this particular
error, print "Second Argument can't be zero"
If all of the above succeed, print the result of division.
Sample Input1:
2.py
Sample Output 1:
Invalid No of Arguments
Sample Input2:
2.py 4 2
Sample Output 2:
2
'''
import sys

#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)
try:
	l=len(sys.argv);
	if (l !=3):
		raise IndexError
	a = sys.argv[1];
	b = sys.argv[2];
	#print("a=%d b=%d" % (int(a),int(b)));
	print(int(a)//int(b));
except IndexError:
	print("Invalid No of Arguments");
except TypeError:
	print("Invalid Type of Arguments");
except ZeroDivisionError:
	print "Second Argument can't be zero"
except ValueError:
	print("Invalid Type of Arguments");
	
	
		

