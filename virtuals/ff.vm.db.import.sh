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
#!/bin/sh

SQLROOTPW=""

if [ "$1" != '' ]; then
  DB=`echo "$1" | sed 's/.sql//g'`
  mysql -uroot -p$SQLROOTPW $DB < $1
  echo "imported database."
elif [ "$1" = 'help' ] || [ "$1" = '' ]; then
  echo "usage:"
  echo "importdb "
  echo "example: to import a database just run the command 'importdb mywebsite.sql' where 'mywebsite' is the name of the database to import into"
fi


################### END
stopwatchtime
## TALON: ff.vm.db.import


