#!/usr/bin/python 
import sys

try:
	length=len(sys.argv)
	if (length != 3):
		raise IndexError
	print(int(sys.argv[1])//int(sys.argv[2]));
except IndexError:
	print("Invalid No of Arguments");
except ZeroDivisionError:
	print "Second Argument can't be zero"
except TypeError:
	print("Invalid Type of Arguments");
except ValueError:
	print("Invalid Type of Arguments");
	
	
		

