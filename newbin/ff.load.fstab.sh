#!/bin/bash


sudo sh -c "echo \"/home/www  /var/www   none  bind  0  0
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
/home/faron/Streamings/files/engine/factory-mp4/output /media/clips   none   bind   0  0
/home/faron/Streamings/files/engine/factory-mp4/mkv /media/clips-raw   none   bind   0  0
/home/faron/.falcon /media/home/faron/.falcon   none   bind   0  0
/home/faron/.falcon/mounts/router /router   none   bind   0  0
<<<<<<< HEAD
=======
=======
/home/users/$USER/Streamings/files/engine/factory-mp4/output /media/clips   none   bind   0  0
/home/users/$USER/Streamings/files/engine/factory-mp4/mkv /media/clips-raw   none   bind   0  0
/mnt/falcon /media/mnt/falcon   none   bind   0  0
/mnt/falcon/mounts/router /router   none   bind   0  0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
/home/local /usr/local  none   bind   0  0
/home/local/lib/node_modules   /usr/lib/node_modules  none  bind  0  0
/home/local/db   /data/db  none  bind  0 0
\" >> /etc/fstab"

echo "FALCON: mounts added to /etc/fstab"

exit 0

