#!/bin/bash
#-------------------------------------------------------------------------------------------#	
#VMWare Fusion Backup Script																#
# Writen by : Jimmy Mokwena																	#
# Date      : 27/02/2014 (last edit 15/05/2014 by Jimmy & Ash)								#
#-------------------------------------------------------------------------------------------#

#SETUP
BACKUPDIR=/Volumes/BACKUP01
LOG_DIR=/Volumes/BACKUP01/logs
LOGFILE=$LOG_DIR/jm_VMBackup.$(date '+%Y-%m-%d').log

	
	
#List all running VM and show last two lines then pass the name to VM
"/Applications/VMware Fusion.app/Contents/Library/vmrun"  list | tail -n +2  | while read VM;
do		


#Shutdown running VM before backup.		
  echo "Suspending : $VM"														>>"$LOGFILE"
  time "/Applications/VMware Fusion.app/Contents/Library/vmrun"  -T fusion suspend "$VM"
 echo 																			>> "$LOGFILE" 
 echo "Suspended    : $VM"														>> "$LOGFILE"
 SuspTime="$(date)"

 
#Dynamically parse the vm Path 
 DIR=`dirname "$VM"`
echo "Rsyncing      :  $DIR"													>> "$LOGFILE"

					    														>> "$LOGFILE"
#Copy Data to mounted volume
echo "Backing up to : $BACKUPDIR"												>> "$LOGFILE"
echo "Start  RSYNC of: $VM" '==------------------------------------------------'>> "$LOGFILE"

#Create variable backustarttime (BKStime)
BKStime = "$(date)"

echo "Started Time and Date: $(date)" 											>> "$LOGFILE"

rsync -azvl "$DIR" "$BACKUPDIR" 												>> "$LOGFILE"


echo                                                           					>> "$LOGFILE"
echo '--== Finish RSYNC of' "$VM" '==------------------------------------------'>> "$LOGFILE"
echo                                                               				>> "$LOGFILE"
echo                                                               				>> "$LOGFILE"

#Create Variable for completed time (ComptdTime)
ComptdTime="$(date)"
echo "End Time and Date:   $(date)"                                     		>> "$LOGFILE"

echo                                                             				>> "$LOGFILE"
echo 'VM Sync Completed' "==---------------------------------------------------">> "$LOGFILE"
echo "End:   $(date)"                                                           >> "$LOGFILE"
#Comparing File
echo "--== Comparing Files ==--------------------------------------------------">> "$LOGFILE"
echo                 	  		                           	        			>> "$LOGFILE"
echo diff -r "$BACKUPDIR" "$VM"    		 										>> "$LOGFILE"
echo                                                          					>> "$LOGFILE"
echo '--==  End of File Comparison' " ==-------------------------------------" 	>> "$LOGFILE"

#Resuming VM state
echo "Resuming     : $VM"						    							>> "$LOGFILE"                             
  time "/Applications/VMware Fusion.app/Contents/Library/vmrun"  -T fusion start "$VM"
echo "Resumed $VM"																>> "$LOGFILE"


#Create variable VMResumed
VMResumed = "$(date)"

echo                                                                 	        >> "$LOGFILE"
echo "Backup Successful! -----------------------------------------------------" >> "$LOGFILE"
echo "End:   $(date)"                                                           >> "$LOGFILE"

#Script summary
echo "Submitted email at : $(date)"                                             >> "$LOGFILE"
echo "VM Suspended at 	 : $SuspTime"                                           >> "$LOGFILE"
echo "Started at    	 : $BKStime"                                            >> "$LOGFILE"
echo "Completed at  	 : $ComptdTime" 										>> "$LOGFILE"
echo "VM Resumed at 	 : $VMResumed"                                          >> "$LOGFILE"

#Send email to administrator with the LogFile
date | mail -s "VMBackup $HOSTNAME" notifications@core.co.za < "$LOGFILE"
done
