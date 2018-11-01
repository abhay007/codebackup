find /var/backup/code_backup -mtime +7 -exec rm -rf {} \;
echo "Code backup deleted older then last 1 weeks  | All Server" | sendmail -v abhaykr.singh@hotmail.com
