#!/bin/bash

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
exit 0

## makessl |
