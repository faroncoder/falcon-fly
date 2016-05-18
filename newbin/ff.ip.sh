#!/bin/bash
#curl http://myip.dnsomatic.com
#echo ""
#hostname -i

THIS=`curl http://myip.dnsomatic.com 2> /dev/null`
echo "$THIS"
echo "$( hostname -i )"


exit 0


