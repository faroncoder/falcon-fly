#!/bin/bash
startgreen=`date +%s`

KEYSSL="$1"

if [ -z "$1" ];
	then
	echo "name of key? "
	read KEYSSL
fi
if [ -z "$LOCSSL" ];
	then
	echo "location of ssl? "
	read LOCSSL
fi


sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$LOCSSL/$KEYSSL.key" -out "$LOCSSL/$KEYSSL.crt"
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

## makessl |
