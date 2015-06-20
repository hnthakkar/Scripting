#!/usr/bin/python 
'''
Write a python script that takes mystring and print it in the form as shown in examples.
If the given input mystring contains some space that should be omitted while printing i.e. Hello World will
be considered as HelloWorld only. You are not supposed to omit any special characters(except space) .
If input mystring contains only spaces, directly print 'Invalid Input!' (without quotes)
There should be no extra spaces in the output.
Input:
Line1-> No of Testcases(tc)(No need to validate it)
Line2-> mystring1.
Line3....tc+1-> mystring2...
Sample Input:
2
Hello
Hi Bye
Sample Output:
HelloolleH
Hell lleH
Hel
leH
He
eH
H
H
HiByeeyBiH
HiBy yBiH
HiB
BiH
Hi
iH
H
H

'''
import re
test=input();
for t in range(0,test):
	mystr=raw_input();
	mystr=mystr.strip(" ");
	if mystr=='':
		print 'Invalid Input!'
		continue
	mystr=mystr.replace(' ','');
	print ("%s%s" % (mystr,mystr[::-1]));
	#print mystr,mystr[::-1]
	l= list(mystr);
	l2=l[::-1]
	#print l,l2
	#print mystr
	for i in range(0,len(l)-1):
		l2[i]=' '
		l[len(l)-1-i]=' '
		print ("%s%s" % ("".join(str(x) for x in l),"".join(str(y) for y in l2) ));
		#print "".join(str(x) for x in l),"".join(str(y) for y in l2) 
	#print l
