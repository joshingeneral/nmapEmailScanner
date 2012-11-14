#/bin/bash
to=YOUREMAILHERE
from=nmap@local
subject="New Machine on Network"
message="";
#mac1=(`ls`);
cd /home/USERNAME/Programs/nmapEmail/
#run nmap scan
scan1="`sudo nmap -sP 192.168.0.1/24 `";

#drop results into mac.txt file
echo $scan1 > /home/USERNAME/Programs/nmapEmail/scan1.txt;

echo $scan1;
#reading the file for last check
filecontent=(`cat "/home/USERNAME/Programs/nmapEmail/macList.lst"`)

#check each mac address in the last check and see if it shows up

for m in "${filecontent[@]}"
do
sed -i "s/MAC Address: $m//g" /home/USERNAME/Programs/nmapEmail/scan1.txt;
echo "We have checked: $m";
done
echo "Read file content!"

message=(`cat scan1.txt | grep MAC`)

if [ "$message" == "" ]
then 
	echo "nothing";
else 
	echo "Found an at least 1 new machine on our network";
        msg="`grep -o ".......................................MAC Address:..................." /home/USERNAME/Programs/nmapEmail/scan1.txt`";
	echo $msg;

	#This produces a listing of each machine on our network that is new
	smallReport="A new machine was found on our network, details can be seen below: \n \n  $msg \n \n ";
 	echo $smallReport > /home/USERNAME/Programs/nmapEmail/smallReport.lst;   
        echo $smallReport;
	
	#This will scan them to find out who they are in more depth
        egrep -o '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' /home/USERNAME/Programs/nmapEmail/smallReport.lst > /home/USERNAME/Programs/nmapEmail/ipList.lst
        scan2="`sudo nmap -iL ipList.lst -O`";
        scan2=" Full list of report can be seen below: \n $scan2";
        
	#This takes the smallReport, scan2 and the first scan and Emails them to whoever is on the list
	sendEmail -f $from -s localhost -t $to -u $subject -m "$smallReport $scan2 \n \n  Entire network scan results: \n $scan1"
	grep -o "MAC Address:..................." scan1.txt | sed 's/MAC Address: //g' >> /home/USERNAME/Programs/nmapEmail/macList.lst
	cat /home/USERNAME/Programs/nmapEmail/macList.lst;
	cat /home/USERNAME/Programs/nmapEmail/smallReport.lst
fi
