#!/bin/bash
# --------------------------------------------------------------------------------------------------------------------
# Query the Tune and Play Database for machines that have been offline for more than 3days                           #
# Create a file with the queried data                                                                                #
# Send an email to address with the contents                                                                         #
#---------------------------------------------------------------------------------------------------------------------

#TIME_STAMP="select datetime('now','localtime');"
test_path="$HOME/Desktop/Machines.db"

hostname=`scutil --get ComputerName`
Database_path="/Library/Application\ Support/Tune\&Play/Machines.db"


results=$(sqlite3 $test_path "select ZIP, ZSERIAL, ZMODEL from ZMACHINE where ZLASTPING >= 259200000";)<<EOF
.mode column;
.width 9,12,15; 
EOF

#writefile
#echo $results


# Email file to recipient
SUBJECT="$hostname"
#Email To?
EMAIL="jmokwena@core.co.za"
# Email text/message
EMAILBODY=$results

# send an email using /bin/mail


/usr/bin/mail -s $SUBJECT jmokwena@core.co.za -- -f jimmy.mokwena@appleistore.co.za << EOF
"$EMAILBODY"
EOF












