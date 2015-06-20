#!/usr/bin/python 

testCases=input();
for i in range(0,testCases):
	value = raw_input();
	value = value.strip(" ");
	if value == '':
		print 'Invalid Input!'
		continue
	value = value.replace(' ','');
	print ("%s%s" % (value,value[::-1]));
	frwd = list(value);
	rev = frwd[::-1]
	for i in range(0,len(frwd)-1):
		rev[i]=' '
		frwd[len(frwd)-1-i]=' '
		print ("%s%s" % (''.join(x for x in frwd),''.join(y for y in rev)));
	
