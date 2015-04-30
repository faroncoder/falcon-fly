#!/bin/sh -e

notify-new "$( tail -n 1 /var/log/syslog )"  -u critical

exit 0

