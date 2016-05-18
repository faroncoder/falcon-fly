#!/bin/bash

GETIP=`hostname -i | cut -d'.' -f4`
CLEANIP=` hostname -i | sed "s/.$GETIP//g"`

for ip in $(seq 1 254); do
	ping -c 1 $CLEANIP.$ip
    [ $? -eq 0 ] && echo "$CLEANIP$ip UP" || : ;
done

exit 0

