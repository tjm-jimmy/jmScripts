#!/bin/bash
# --------------------------------------------------------------------------------------------------------------------
# Query the Tune and Play Database for machines that have been offline for more than 3days                           #
# Create a file with the queried data                                                                                #
# Send an email to address with the contents                                                                         #
#---------------------------------------------------------------------------------------------------------------------

#TIME_STAMP
timestamp() {
date +"%d-%m-%y | %T"
}



hostname=`scutil --get ComputerName`
#Database="/Library/Application Support/Tune&Play/Machines.db"
test_path="$HOME/Desktop/Machines.db"


#Email Variables
# Email file to recipient
SUBJECT="$hostname"
#Email To?
EMAIL="agokal@me.com","jimmy.mokwena@myistore.co.za"
EMAILBODY="$results"
#EMAILBODY2="All machines are paired"


#Query the colummns of the sqlite3 database and submit that to a variable
results=$(sqlite3 sqlite3 "$Database_path" "select ZIP, ZSERIAL, ZMODEL from ZMACHINE where ZLASTPING >= 259200000";)<<EOF
.mode column;
.width 9,12,15; 
EOF


#Error handling or conditional output hanfling

if [ "$results" = '' ]; then
              echo "All Machine are paired" | /usr/bin/mail -s $SUBJECT2 $EMAIL -c jimmy.mokwena@appleistore.co.za
		  else
		echo "$results" | /usr/bin/mail -s $SUBJECT $EMAIL -c jimmy.mokwena@appleistore.co.za
           fi
          