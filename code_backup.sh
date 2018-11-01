#!/bin/sh
####################################
#
#Backup to NFS mount script.
#
####################################

# What to backup.
backup_files="/var/www/"

# Where to backup to
dest="/var/backup/code_backup/"

day=$(date +%A)
#hostname=$(localhost -s)
archive_file="server$code_backup$(date +%F_%R).tgz"

# Print start status message.
echo "Backing up $backup_files to $dest$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

##Backup done mail
echo "Subject: Code backup done on Server " | sendmail -v abhaykr.singh@hotmail.com
