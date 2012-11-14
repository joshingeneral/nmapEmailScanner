Nmap Email Scanner
=============

We use this library on GitHub when rendering your README or any other
rich text file.

Pre-Installation
-----------
	Install postfix for Email
	Edit nmapEmail.sh for your network settings, 
		replace the words that are in all caps with your username and email, some of the files are blank, they will be built as it finds machines on your network. 

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

