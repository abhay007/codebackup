#!/bin/sh
####################################
#
#Delete Code backup which is more then then 7 days old
#
####################################
find /var/backup/code_backup -mtime +7 -exec rm -rf {} \;
echo "Code backup deleted older then last 1 weeks  | All Server" | sendmail -v abhaykr.singh@hotmail.com
