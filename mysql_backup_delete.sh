#!/bin/sh
####################################
#
#Delete MySql old Dump which is more then then 7 days old
#
####################################
find /var/backup/mysql_backup/ -mtime +7 -exec rm -rf {} \;
echo "MySQL dump deleted older then last 7 days  | Server1" | sendmail -v abhaykr.singh@hotmail.com 
