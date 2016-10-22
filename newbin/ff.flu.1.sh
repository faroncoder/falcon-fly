#!/bin/bash

#sudo flumotion-manager -v -T tcp -H 192.168.1.10 -P 8642 /etc/flumotion/managers/default/planet.xml
/usr/local/bin/flumotion-manager -v -T tcp /usr/local/etc/flumotion/managers/default/planet.xml  | /usr/local/bin/flumotion-worker -v -T tcp -u user -p test