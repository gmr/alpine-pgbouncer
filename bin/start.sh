#!/bin/sh
res=`env |grep -e '^PGB_'`
if [ "$?" -eq "0" ]; then
  echo "Found PGB_* environment variables running built in templates"
  python generate_config.py --template /templates/pgbouncer.ini --dest /etc/pgbouncer
  if [ $PGB_USERLIST"0" != "0" ]; then
    echo "Found PGB_USERLIST; should be in format PGB_USERLIST=user1:md5password,user2:plainpass"
    python generate_config.py --template /templates/userlist.txt --dest /etc/pgbouncer/
  fi
fi

until [ -f /etc/pgbouncer/pgbouncer.ini ]
do
     # Do not know why this was originally added; maybe a race condition with the mount
     # Leaving it for now but adding a cap for the wait
     until_count=$((until_count+1))
     if [ "$until_count" -gt "2" ]; then
       echo "FATAL: not found /etc/pgbouncer/pgbouncer.ini after 10 seconds"
       exit 1
     fi

     echo "Did not find /etc/pgbouncer/pgbouncer.ini waiting 5 seconds"
     sleep 5
done

chown -R pgbouncer /etc/pgbouncer
/usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini
echo "PGBouncer exited with code $?"
