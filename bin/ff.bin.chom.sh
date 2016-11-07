#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

USER="$USER"
GROUP="$USER"
LOCP="$PWD"

if [ "$LOCP" = '' ];
	then
		LOCP="$PWD"
		FIND=`echo $PWD | grep '/srv/www/'`
		if [[ "$FIND" != "" ]];
			then
				USER="www-data"
				GROUP="www-data"
				echo -e "$fcc $fcy $USER:$GROUP $fco"
		fi
		FIND=`echo $LOCP | grep '/etc'`
		if [[ "$FIND" != "" ]];
			then
				USER="root"
				GROUP="root"
				echo -e "$fcnf Dry run for $fcy $USER:$GROUP $fco"
		fi
		FIND=`echo $LOCP | grep '/home/users/$USER'`
		if [[ "$FIND" != "" ]];
			then
				USER="faron"
				GROUP="faron"
				fcm="$fcy SELECTED $fco"
				echo -e "$fcnf $fcy $USER:$GROUP $fco"
		fi
fi

while :
do
    case "$1" in
	-c)
			USER="$2"
			GROUP="$3"
			shift 3
	;;
    --dry)
			echo -e "$fcer"
			fcm="$fcy SELECTED $fco"
			echo -e "$fcnf Dry run for $fcy $USER:$GROUP $fco"
			shift 3
			XeF
			break
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
	 		echo -e "$fcnf Dry run for $fcy $USER:$GROUP $fco"
	 		chown -R "$USER:$GROUP" $PWD
			echo -e "$fcok "
			chmod -R 775 $PWD
			echo -e "$fcok" 
#echo -e "$fcok $fcy$( basename $0 )$fco"

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.chom.sh  [ACTIVE] y

