#!/usr/bin/python 
'''
Manish and Gaurav are the room partners and they will be leaving college once they are done with
their studies. So they have decided to note down everything they have in their room so they can split
between them later(batwara :P).
If the thing can be equally split they both will get half-half, otherwise it will go to the charity. (charity
here means the nearby rooms, the juniors).
The input file contains the information in the format <Item_Name>:<Count> e.g. Mirror:1.
The item can appear multiple number of times in the input file so you have treat on the basis of total
count. i.e. If there are following two entries in the input.txt
Table:1
Table:1
So, There are two tables and it can be split.
You have to generate two files, one file containing the items that can be split between them and other
file containing the items that will go to the charity.
The items should be sorted (alphabetically by item names) in the both output files and it will contains
only item names and not the count.
Take the input file as the first command line argument and path of the output directory as the second
argument.
Note:
1) If the output directory doesn't exists your script has to create it.
2) The name of the output file should be "split.txt", file containing list of items that can be split and the
"charity.txt", file containing list of items that can't be split. These output file will be created inside the
specified output folder.
3) If there is no item to split, the split.txt should be created and empty, similarly for the charity.txt
Assume Valid Inputs.
Sample Input:
File: arg1
Table:1
Bed:2
Mirror:1
Pen:3
Table:1
Sample Output:
File 1: arg2/split.txt
Bed
Table
File 2: arg2/charity.txt
Pen
Mirror
'''

import sys
import os
import re
import os.path
input_file=sys.argv[1]
output_dir=sys.argv[2]
s=output_dir+'/split.txt' #split file
c=output_dir+'/charity.txt' #charity file
if not os.path.exists(output_dir):
    os.makedirs(output_dir)
f1=open(s,'w');
f2=open(c,'w');
f=open(input_file,'r');
my_dict={}
for line in f:
	#print line;
	my_list=re.split(':',line);
	if my_list[0] in my_dict:
		my_dict[my_list[0]]=int(my_dict[my_list[0]])+ int(my_list[1]);
	else:
		my_dict[my_list[0]]=int(my_list[1]);
f.close()
	#print my_dict
	#print my_dict.keys();
	#print my_dict.values()
my_tuple=sorted(my_dict.items());
for i in my_tuple:
	k=i[0];
	v=i[1];
	if int(v) % 2 == 0:
		f1.write("%s\n" % (k));
	else:
		f2.write("%s\n" % (k));
f1.close();
f2.close();
			

		
    














