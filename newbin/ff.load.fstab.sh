#!/bin/bash


sudo sh -c "echo \"/home/www  /var/www   none  bind  0  0
/home/faron/Streamings/files/engine/factory-mp4/output /media/clips   none   bind   0  0
/home/faron/Streamings/files/engine/factory-mp4/mkv /media/clips-raw   none   bind   0  0
/home/faron/.falcon /media/falcon   none   bind   0  0
/home/faron/.falcon/mounts/router /router   none   bind   0  0
/home/local /usr/local  none   bind   0  0
/home/local/lib/node_modules   /usr/lib/node_modules  none  bind  0  0
/home/local/db   /data/db  none  bind  0 0
\" >> /etc/fstab"

echo "FALCON: mounts added to /etc/fstab"

exit 0

