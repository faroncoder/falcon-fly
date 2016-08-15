#!/bin/bash
startgreen=`date +%s`

<<<<<<< HEAD
=======
<<<<<<< HEAD
/bin/chown -R www-data:www-data /home/faron/var/Scripts/htmls/projects
/bin/chmod -R 775 /home/faron/var/Scripts/htmls/projects

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
/.bin/chown -R www-data:www-data /home/faron/var/Scripts/htmls/projects
/.bin/chmod -R 775 /home/faron/var/Scripts/htmls/projects

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
<<<<<<< HEAD
=======
=======
/.bin/chown -R www-data:www-data /home/users/$USER/var/Scripts/htmls/projects
/.bin/chmod -R 775 /home/users/$USER/var/Scripts/htmls/projects

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

