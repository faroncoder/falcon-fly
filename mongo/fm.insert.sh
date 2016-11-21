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
	ping=`echo $single | sed "s/'//g"`
	ping=`echo $ping | sed 's/"//g'`
	trim1=`echo $ping | cut -d':' -f 1`
	trim2=`echo $ping | cut -d':' -f 2`
	CHK=`echo $trim2 | grep '[A-Za-z]' `
	if [[ "$CHK" != "" ]]; then
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
#echo $THIS
echo  "db.$2.insert( $THIS )" | mongo $1 --quiet 2>/dev/null

#echo "db.$2.insert( { $QUERY } )" | mongo $1 --quiet 2>/dev/null
_send=$CHR23; _comment="Data added!"
_FT

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] fm.insert.sh  [ACTIVE] y

