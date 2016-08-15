#!/bin/bash
export PGVERSION=`pg_lsclusters -h | head -n 1 | cut -d' ' -f1`

sudo apt-get install postgresql
sudo sh -c "rm /etc/postgresql/$PGVERSION/main/pg_hba.conf"

sudo sh -c "echo \"# TYPE  DATABASE        USER            ADDRESS                 METHOD
# OpenNMS change: configure local, IPv4 and IPv6 connections made from localhost to not require authentication
# \"local\" is for Unix domain socket connections only
local   all             all                                     trust # the default method is peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust # the default method is md5
# IPv6 local connections:
host    all             all             ::1/128                 trust # the default method is md5\" >> /etc/postgresql/$PGVERSION/main/pg_hba.conf"

sudo systemctl restart postgresql

exit 0