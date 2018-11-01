s3cmd sync --skip-existing /var/backup s3://server_code_mysql_backup

echo "Subject: MySQL & Code backup is on S3 bucket for  Server " | sendmail -v abhaykr.singh@hotmail.com
