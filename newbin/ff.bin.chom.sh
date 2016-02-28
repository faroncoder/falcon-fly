
#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; 
fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; 
fcm="$fcc CUSTOM $fco"
fcnf="[$fcy $fcm $fco]"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [[ "$1" != "" ]]; then
#################### BEGIN

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
		FIND=`echo $LOCP | grep '/home/faron'`
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

################### END
#cd $RETURN
#else echo -e "$fcer Arg 1=$fcy empty$fco"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y
