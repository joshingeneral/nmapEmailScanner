Nmap Email Scanner
=============
This will give you the basics in order to get the scanner running. 
Coding language = Linux Bash 

Pre-Installation
-----------
	run apt-get install postfix
	run apt-get install nmap 
	Edit nmapEmail.sh for your network settings, 
		
Installation
-----------

	1. Copy to folder of you choice.
	2. Run chmod 775 on all files.
	3. Run ./nmapEmail.sh and it will scan and generate a report
	4. Install into crontab using crontab -e and 
	   */30 * * * /PATH/TO/SCRIPTS/nmapEmail.sh (script will run every 5 minutes)


Usage
-----

	Run ./nmapEmail.sh 
	Email will be sent via postfix


Troubleshooting
-----------------
Some ISPs are blocking the ability to send outbound Emails if that is the case use their SMTP settings using this link:
http://www.cyberciti.biz/faq/postfix-smtp-authentication-for-mail-servers/

