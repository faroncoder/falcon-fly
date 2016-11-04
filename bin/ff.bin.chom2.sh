#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
USER=""
GROUP=""
LOCP="$PWD"

if [ "$LOCP" = '' ];
	then
		LOCP="$PWD"
		echo $PWD > /tmp/a.dat
		FIND=`echo $PWD | grep '/srv/www/'`
		if [[ "$FIND" != "" ]];
			then
				USER="www-data"
				GROUP="www-data"
				echo $USER:$GROUP $fcok
		fi
		FIND=`echo $LOCP | grep '/etc'`
		if [[ "$FIND" != "" ]];
			then
				USER="root"
				GROUP="root"
				echo $USER:$GROUP $fcok
		fi
		FIND=`echo $LOCP | grep '/home/users/$USER'`
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

chown -R "$USER:$GROUP" $PWD
sudo chmod -R 775 $PWD/*



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.chom2.sh  [ACTIVE] y

