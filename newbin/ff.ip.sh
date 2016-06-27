#!/bin/bash
THIS=`curl http://myip.dnsomatic.com 2> /dev/null`
echo "Public IP: $THIS"
echo "Local IP: $( hostname -i )"
exit 0
