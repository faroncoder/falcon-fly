<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
#!/bin/bash
startgreen=`date +%s`


stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
<<<<<<< HEAD
=======
=======
#!/bin/sh -e

notify-new "$( tail -n 1 /var/log/syslog )"  -u critical

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

