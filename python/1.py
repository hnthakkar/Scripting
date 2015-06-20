#!/usr/bin/python 

#checks whether pallindrome or not
'''
Write a python script to check if the input is palindrome.(no validation needed)
Take input in loop and break when the input is -1.
Print Yes/No respectively.
Note: Use Iterative approach (not recursive !).
Sample Input/Output :
lovlean
No
arora
Yes
parle-G
No
1 1
Yes
-1
2.
Write a python
'''
'''
count=0;
while(1):
   print 'hi'
   count = count+1;
   if (count == 2):
		break;
'''

while(1):
	str=raw_input();
	if(str=='-1'):
		break
	else:
		flag=1
		l=len(str)
		for k in range(0,(l-1)/2):
			if(str[k]!=str[l-1-k]):
				flag=0;
				break;
		if(flag==1):
			print('Yes');
		else:
			print('No');
			
			
				
			
			
	
