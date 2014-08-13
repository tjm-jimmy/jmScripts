#!/bin/bash
# --------------------------------------------------------------------------------------------------------------------
# Query the Tune and Play Database for machines that have been offline for more than 3days                           #
# Create a file with the queried data                                                                                #
# Send an email to address with the contents                                                                         #
#---------------------------------------------------------------------------------------------------------------------

#TIME_STAMP="select datetime('now','localtime');"
hostname=`scutil --get ComputerName`
Database_path="/Library/Application Support/Tune&Play/Machines.db"


results=$(sqlite3 $Database_path "select ZIP, ZSERIAL, ZMODEL from ZMACHINE where ZLASTPING >= 259200000";)<<EOF
.mode column;
.width 9,12,15; 
EOF

if [$results ==1]
	
	then
			# Email file to recipient
			SUBJECT="$hostname"
			#Email To?
			EMAIL=jimmy@core.co.za,ash@core.co.za,roey.saban@core.co.za;it@core.co.za
			# Email text/message
			EMAILBODY="$results"
			EMAILBODY2="All machines are paired"

			# send an email using /bin/mail
			/usr/bin/mail -s $SUBJECT $EMAIL < $EMAILBODY

	else

			/usr/bin/mails -s $SUBJECT $EMAIL < $EMAILBODY2
fi



#writefile
#echo $resulta > file.txt











