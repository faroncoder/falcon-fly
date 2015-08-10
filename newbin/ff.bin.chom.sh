#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

#if [ "$1" != "" ]; then
#################### BEGIN
USER=""
GROUP=""
LOCP="$1"

if [ "$LOCP" = '' ];
	then
		LOCP="$PWD"
		echo $PWD > /tmp/a.dat
		FIND=`echo $LOCP | grep '/www/html'`
		if [[ "$FIND" != "" ]];
			then
				USER="www-data"
				GROUP="www-data"
				echo $USER:$GROUP
		fi
		FIND=`echo $LOCP | grep '/etc'`
		if [[ "$FIND" != "" ]];
			then
				USER="root"
				GROUP="root"
				echo $USER:$GROUP
		fi
		FIND=`echo $LOCP | grep '/home/faron'`
		if [[ "$FIND" != "" ]];
			then
				USER="faron"
				GROUP="faron"
				echo $USER:$GROUP
		fi
fi

#if [ -f "/tmp/a.dat" ];
#	sudo rm -f /tmp/a.dat
#fi

while :
do
    case "$1" in
   #  --www)
		 #  	USER="www-data"
		 #  	GROUP="www-data"
		 #  	shift
		 #  	;;
   #  --faron)
			# USER="faron"
		 #  	GROUP="faron"
		 #  	shift
		 #  	;;
	-c)
			USER="$1"
			GROUP="$2"
			shift 3
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

sudo chown -R "$USER:$GROUP" $LOCP
sudo chmod -R 775 $LOCP



################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.bin.www-ch-own-mod "
#  echo "example:    "
#fi

stopwatchtime
## TALON: ff.bin.www-ch-own-mod


