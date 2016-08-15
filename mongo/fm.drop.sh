#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}
helpecho() {
<<<<<<< HEAD
echo "execute 'fm.drop [db] [collection]'"
=======
echo "execute 'ff.mongo.drop [db] [collection]'"
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
echo "to remove a collection (table) from specific db"
  stopwatchtime
}

if [ "$2" != "" ]; then
#################### BEGIN

CMD="db.$2.drop()"
#CMD="runCommand({ drop: $1 })"
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

echo -n "Are you really sure ?  [type 'yes' to proceed] "
read CONFIRMATION
if [ "$CONFIRMATION" = "yes" ] ||  [ "$CONFIRMATION" = "Y" ]; then
echo "$CMD" | mongo $1 --quiet
#mongo $1 "/tmp/mongo.dat"
## place your script here
#> /tmp/mongo.dat
fi
################### END
else
	helpecho
fi

stopwatchtime
<<<<<<< HEAD
## TALON: fm.drop
=======
## TALON: ff.mongo.drop
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
