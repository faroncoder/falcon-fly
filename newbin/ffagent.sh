#!/bin/bash
SERVER="$1"
if [ -z "$1" ]
	then
	echo -n "Which server ip?  "
	read SERVER
fi

eval `ssh-agent -s`
ssh-copy-id -i ~/.ssh/id_rsa.pub $SERVER


exit 0

