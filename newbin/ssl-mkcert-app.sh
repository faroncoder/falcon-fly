#!/bin/bash
newkey="$1"
if [ -z "$newkey" ]
	then
	   echo -n "name for key? "
	   read newkey
fi
openssl req -x509 -newkey rsa:1024 -keyout /etc/ssl/private/$newkey.key -out /etc/ssl/certs/$newkey.crt  -nodes -days 365
echo "$newkey key-certified"

exit 0
