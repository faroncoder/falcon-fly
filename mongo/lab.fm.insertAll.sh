#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
DATABASE=$1
TABLE=$2
ARG=$( ${@:3} )
echo $ARG

DATABASE=$1
TABLE=$2
ARG="${@:3}"



while :
	do
	case "${ARG}" in
		$ARG) 
			if [[ "$2" == "" ]]; then
				echo -e "$fcer no entry for $1";
				exit 1;
				break;
			else
				if [[ "$SRING" != "" ]]; then
					SRING="$SRING,\"$1\":\"$2\""
					shift 2
				else
					SRING="\"$1\":\"$2\"";
					shift 2;
				fi	
			fi
			;;
	esac
done

echo -e "$fcok $DATABASE"
echo -e "$fcok $TABLE"
echo -e "$fcok $SRING"

# while :
# 	do
# 	case "$3" in
# 	$3)	
# 			if [[ "$4" != "" ]]; then  SRING="\"$1\":\"$2\""; fi;  shift 2 ;;

# 		# $1)

# 		# 	if [[ "$1" == "" ]]; then break; else SRING="$SRING, \"$1\":\"$2\""; shift 2 ;; fi
# 		*) 		echo -e "$fcer name of object can't be empty"
# 				break; exit 1 ;;

# 		--)  	echo -e "$fcer name of object can't be empty"; break; exit 2;;
# 	esac
# done



#for j in ${GET[@]}; do echo -e "db.$2.insert({ \"name\":\"$j\" })" | mongo $1 --silent; echo -e "$fcok: $j" done



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.fm.insertAll.sh  [ACTIVE] y

