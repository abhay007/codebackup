#!/bin/bash

DB_BACKUP="/var/backup/mysql_backup/`date +%Y-%m-%d`"
DB_USER="root"
DB_PASSWD="********"
HN=`hostname | awk -F. '{print $1}'`
DB_NAME="--all-databases"


# Create the backup directory
mkdir -p $DB_BACKUP

# Remove backups older than 10 days
find /var/backup/mysql_backup/ -maxdepth 1 -type d -mtime +10 -exec rm -rf {} \;

# Option 1: Backup each database on the system using a root username and password
for db in $(mysql --user=$DB_USER --password=$DB_PASSWD -e 'show databases' -s --skip-column-names|grep -vi information_schema);
do mysqldump --user=$DB_USER --password=$DB_PASSWD --opt $db | gzip > "$DB_BACKUP/$db-$(date +%Y-%m-%d).gz";
done


echo "Subject: MySQL dump backup done on Server " | sendmail -v abhaykr.singh@hotmail.com
# Option 2: If you aren't using a root password then comment out option 1 and use this
# for db in $(mysql -e 'show databases' -s --skip-column-names|grep -vi information_schema);
# do mysqldump --opt $db | gzip > "$DB_BACKUP/mysqldump-$HN-$db-$(date +%Y-%m-%d).gz";
# done

