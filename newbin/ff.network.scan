#!/bin/bash

<<<<<<< HEAD
GETIP=`hostname -i | cut -d'.' -f4`
CLEANIP=` hostname -i | sed "s/.$GETIP//g"`

for ip in $(seq 1 254); do
	ping -c 1 $CLEANIP.$ip
    [ $? -eq 0 ] && echo "$CLEANIP$ip UP" || : ;
=======
for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null;
    [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ;
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
done

exit 0

