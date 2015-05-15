#!/bin/bash
sudo flumotion-worker -d 3 -v -T tcp -H 192.168.1.10 -P 8642 -u faron -p great /etc/flumotion/workers/faron.xml

exit 0

