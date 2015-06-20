#!/usr/bin/python 
'''
Snehal loves to drink chai. In IIIT, Chai is well known by two names "choti wali" and "badi wali".
She is bit lazy and searches for the nearest canteen from the GH hostel in the IIIT campus. If more than
one canteen are at the equal distance then out of them, she will prefer the canteen with the low cost of
"choti wali" and if again, more than one canteen have the same cost of "choti wali" then out of them,
she will prefer the canteen with the low cost of the "badi wali". If the cost of the "badi wali" is also
same then she will be confused and will go to CCD :P.
Input: First argument is the input csv file (.csv) which contains data in the following format(without the
angle brackets).
<Canteen Name 1>,<Distance 1>,<Cost of choti chai 1>,<Cost of badi chai 1>
<Canteen Name 2>,<Distance 2>,<Cost of choti chai 2>,<Cost of badi chai 2>
Output:
Name of the canteen Snehal will go and if she will not go out, print CCD. If input file is empty or
doesn't exists, print on console 'Chai Not found!'
Sample Input1:
File: arg1
Jersy,10,5,6
NV Canteen,10,3,6
Sample Output1:
NV Canteen
Sample Input2:
File: arg1
Jersy,10,5,6
NV Canteen,10,5,6
Sample Output2:
CCD
'''
import sys
import os
import re
import os.path
f=sys.argv[1];
if (not os.path.exists(f)): #file not present
	print 'Chai Not found!'
elif os.stat(f)[6]==0: #File empty
	print 'Chai Not found!'
else:
	myf=open(f,'r')
	mat=myf.readlines()
	count=0;
	for x in mat:
		l=re.split(',',x);
		l[1]=int(l[1])
		l[2]=int(l[2])
		l[3]=int(l[3])
		mat[count]=l
		count=count+1		
	#print mat
	#print len(mat)
	if(len(mat)==1):
		print mat[0][0]
	else:
		mat.sort(key=lambda x: x[1])
		#print mat
		mymin=int(mat[0][1])
		mat2=[];
		for x in mat:
			if int(x[1]) ==mymin:
				mat2.append(x)
		mat=[]
		#print mat2
		if(len(mat2)==1):
			print mat2[0][0]
		else:
			mat2.sort(key=lambda x: x[2])
			#print mat2
			mymin=int(mat2[0][2])
			mat=[];
			for x in mat2:
				if int(x[2]) ==mymin:
					mat.append(x)
			mat2=[]
			#print mat
			if(len(mat)==1):
				print mat[0][0]
			else:
				mat.sort(key=lambda x: x[3])
				#print mat2
				mymin=int(mat[0][3])
				mat2=[];
				for x in mat:
					if int(x[3]) ==mymin:
						mat2.append(x)
				mat=[]
				#print mat2
				if(len(mat2)==1):
					print mat2[0][0]
				else:
					print 'CCD'
			
			
			
			
			




