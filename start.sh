#!/bin/sh
until [ -f /etc/pgbouncer/pgbouncer.ini ]
do
     sleep 5
done
/usr/bin/pgbouncer /etc/pgbouncer/pgbouncer.ini
