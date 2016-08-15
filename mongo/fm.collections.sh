#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	exit 0
}
helpecho() {
<<<<<<< HEAD
echo "execute 'fm.collections [db]'"
echo "execute fm.dbs to find existing database for this command"
=======
echo "execute 'ff.mongo.collections [db]'"
echo "execute ff.mongo.dbs to find existing database for this command"
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
  stopwatchtime
}

#################### BEGIN
if [ "$1" != "" ]; then

CMD="show collections"

while :
do
    case "$1" in
  	--help)
			helpecho
			stopwatchtime
	;;
       --) # End of all options
	 	shift
	  	break
	  ;;
      -*)
	  	echo "Error: Unknown option: $1" >&2
	  	exit 1
	  ;;
      *)  # No more options
	  	break
	  ;;
    esac
done


echo "$CMD" | mongo $1 --quiet
#mongo $1 "/tmp/mongo.dat"
## place your script here
#> /tmp/mongo.dat


################### END
else
	helpecho
fi
stopwatchtime
<<<<<<< HEAD
## TALON: fm.collections
=======
## TALON: ff.mongo.collections
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
