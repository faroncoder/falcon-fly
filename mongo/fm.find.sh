#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}
helpecho() {
echo 'usage: ff.mongo.insert [collection] [query stings]'
  echo 'example:  ff.mongo.find faron admin'
  stopwatchtime
}

if [ "$1" != '' ] && [ "$2" != '' ]; then
#################### BEGIN

CMD="db.$2.find();"

# while :
# do
#     case "$1" in
#   	-f)
# 			FDL="$FDL,$2:1"
# 			CMD="db.$1.find({},{ $FDL });"
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
fi

################### END
if [ "$1" = '' ]; then
		helpecho
fi
if [ "$1" = '' ] && [ "$2" = '' ]; then
		helpecho
fi

stopwatchtime
## TALON: ff.mongo.insert


