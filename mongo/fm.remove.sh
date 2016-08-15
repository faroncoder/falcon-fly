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
echo "usage: `echo $0` [collection] [query stings]"
  echo "example:  `echo $0` faron admin \"{id:100}\""
  echo "example:  `echo $0` faron admin \"{}\" to remove everything from the collection"
  stopwatchtime
}

if [ "$3" != '' ]; then
#################### BEGIN

CMD="db.$2.remove($3);"

# while :
# do
#     case "$1" in
#   	-f)
# 			FDL="$FDL,$2:1"
# 			CMD="db.$1.remove({},{ $FDL });"
# 			shift 2
# 	;;
#        --) # End of all options
# 	 	shift
# 	  	break
# 	  ;;
#       -*)
# 	  	echo "Error: Unknown option: $1" >&2
# 	  	exit 1
# 	  ;;
#       *)  # No more options
# 	  	break
# 	  ;;
#     esac
# done



echo "$CMD" | mongo $1 --quiet
#mongo $1 "/tmp/mongo.dat"
## place your script here
#> /tmp/mongo.dat
else
	helpecho
fi

################### END

stopwatchtime
<<<<<<< HEAD
## TALON: fm.remove
=======
## TALON: ff.mongo.remove
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927


