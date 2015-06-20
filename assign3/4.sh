#!/bin/bash			
# This script writes a HTML with system details

echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<title>
	System_information for $(hostname)
</title>
<head>
	<center> System Information for $(hostname) </center>
</head>
<br/>		
<br/>	
<br/>	
<br/>
<center> 
	<h6> Current Time : $(date +\"%T\") </h6> 
	<h6> DATE :  $(date +\"%m-%d-%Y\") </h6>	
</center>
<center>
	<body >
	<table border="1" style="text-align:center">
		<tr>
			<th>UserName</th>
			<td>$USER</td>
		</tr>
		<tr>
			<th>OS</th>
			<td>`uname -o`</td>
		</tr>
		<tr>
			<th>RAM SIZE</th>
			<td>`cat /proc/meminfo | awk 'match($1,"MemTotal") == 1 {print $2}'`</td>
		</tr>
		<tr>
			<th>Available Memory</th>
			<td>`cat /proc/meminfo | awk 'match($1,"MemFree") == 1 {print $2}'`</td>
		</tr>
		<tr>
			<th>Architecture</th>
			<td>`lscpu | awk 'match($1,"Architecture:") == 1 {print $2}'`</td>
		</tr>
		<tr>
			<th>CPU op-mode(s)</th>
			<td>`lscpu | grep -i "CPU op-mode(s):" | awk -F":" '{print $2}' | sed 's/[[:space:]]//g'`</td>
		</tr>
		<tr>
			<th>Byte Order</th>
			<td>`lscpu | grep -i "Byte Order:" | awk -F":" '{print $2}' | sed 's/[[:space:]]//g'`</td>
		</tr>
		
		<tr>
			<th>Vendor ID </th>
			<td>`lscpu | grep -i "Vendor ID:" | awk -F":" '{print $2}' | sed 's/[[:space:]]//g'`</td>
		</tr>
		
		<tr>
			<th> Up time </th>
			<td>`uptime | awk '{print $3}' | sed 's/,//'`</td>
		</tr>
		<tr>
			<th>Page size</th>
			<td>`getconf PAGE_SIZE`</td>
		</tr>
		<tr>
			<th>Swap space</th>
			<td>`swapon -s | tail -1 | awk '{print $3}'`</td>
		</tr>
		<tr>
			<th>Mac address</th>
			<td>`cat /sys/class/net/eth0/address`</td>
		</tr>
		<tr>
			<th>IP address</th>
			<td>`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`</td>
		</tr>
	</table>
		<p><b>Drive space:</b>`df --total -m | grep total | awk '{ print $2 }'`</p>
		<p><b>Home space:</b>`df -mT /home | sed -n '2p' | awk '{ print $3 }'`</p>
	</body>
</center>	
</head>
</html>" > 4.html
exit 0


