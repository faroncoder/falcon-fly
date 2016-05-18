#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}
helpecho() {
echo "usage: `echo $0` [db]"
echo "example:  `echo $0` faron"
    stopwatchtime
}

if [ "$1" != '' ]; then
#################### BEGIN

CMD="db.runCommand( { dropDatabase: 1} )"



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
else
	stopwatchtime
fi

else
	helpecho
fi

################### END

stopwatchtime
## TALON: fm.dropdb.sh


