#!/bin/sh
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	exit 0
}
#################### BEGIN

SQLUSER=""
SQLROOTPW=""

if [ "$1" != '' ]; then
  echo "CREATE DATABASE $1" | mysql -uroot -p$SQLROOTPW
  echo "GRANT ALL ON $1.* TO '$SQLUSER'@'localhost'" | mysql -uroot -p$SQLROOTPW
  echo "flush privileges" | mysql -uroot -p$SQLROOTPW
  echo "added database."
elif [ "$1" = 'help' ] || [ "$1" = '' ]; then
  echo "usage:"
  echo "sudo adddb "
  echo "example: to create a new database just run the command 'sudo adddb mywebsite'"
fi


################### END
stopwatchtime
## TALON: ff.vm.db.add


