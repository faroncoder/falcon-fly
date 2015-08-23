#!/bin/bash
if [ "$EUID" = 0 ]; then

service networking restart
service network-manager restart

else

sudo service networking restart
sudo service network-manager restart

fi

exit 0
