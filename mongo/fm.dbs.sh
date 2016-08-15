#!/bin/bash
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
helpecho() {
<<<<<<< HEAD
HELP="execute fm.dbs without arguments"
=======
HELP="execute ff.mongo.dbs without arguments"
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
  echo $HELP
  stopwatchtime
}

#################### BEGIN

CMD="show databases"

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

stopwatchtime
<<<<<<< HEAD
## TALON: fm.dbs
=======
## TALON: ff.mongo.dbs
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
