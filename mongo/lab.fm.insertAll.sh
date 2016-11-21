#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
DATABASE=$1
TABLE=$2
ARG=( `echo ${@} | awk '{ $1="";$2=""; print $0 }' ` )

COMA=""
for single in "${ARG[@]}"; do
	#ping=`echo $single | sed 's/://g'`
	ping=`echo $single | sed "s/'/\"/g"`
	trim1=`echo $ping | cut -d':' -f 1`
	trim2=`echo $ping | cut -d':' -f 2`
	CHK=`echo $trim2 | grep '[0-9]' `
	if [[ "$CHK" == "" ]]; then
		OL="\""
	else
		OL=""
	fi
	populate="$COMA\"$trim1\":$OL$trim2$OL"
	populateALL="${populateALL}$populate"
	COMA=","
done

THIS="[{${populateALL}}]"

# echo -e $THIS
# echo ${THIS}
echo  "db.$2.insert( ${THIS} )" | mongo $1 --quiet 2>/dev/null

# echo "db.$2.insert( `echo ${populateALL}`  )" | mongo $1 --quiet 2>/dev/null
# _send=$CHR23; _comment="Data added!"
# _FG



# while :
# 	do
# 	case "${ARG}" in
# 		$ARG)
# 			if [[ "$2" == "" ]]; then
# 				echo -e "$fcer no entry for $1";
# 				exit 1;
# 				break;
# 			else
# 				if [[ "$SRING" != "" ]]; then
# 					SRING="$SRING,\"$1\":\"$2\""
# 					shift 2
# 				else
# 					SRING="\"$1\":\"$2\"";
# 					shift 2;
# 				fi
# 			fi
# 			;;
# 	esac
# done



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

