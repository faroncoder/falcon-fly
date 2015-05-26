#!/bin/bash
startgreen=`date`
newkey="$1"
if [ -z "$newkey" ]
	then
	   echo -n "name for key? "
	   read newkey
fi
openssl req -x509 -newkey rsa:1024 -keyout /etc/ssl/private/$newkey.key -out /etc/ssl/certs/$newkey.crt  -nodes -days 365
echo "$newkey key-certified"

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
