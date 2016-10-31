#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
FILE=$1
OPTION=$2
if [[ ! -f "$FILE" ]]; then
	export LC_ALL=C
	cat "$@"  | tr "\t" "\n" | awk '{print $0}' |
	sed 's/"/\\"/g' | sed 's/\$/\\\$/g' | sed "s/'/\\'/g"

else
	if [[ "$OPTION" == "-o" ]]; then
		ST=`basename $FILE`
		EXT=`echo $FILE | tr '.' '  ' | awk '{print $2}'`
		FUL=`echo $FILE | tr '.' '  ' | awk '{print $1}'`
		if [[ "$EXT" != "" ]]; then
			FILENW="$FUL-escaped.$EXT"
		else
			FILENW="$FUL-escaped"
		fi

		# cat $FILE  | tr "\t" "\n" | awk '{print $0}' | sed 's/\\/\\\\/g' |
		# sed 's/\//\\\//g'  | sed 's/"/\\"/g' | sed 's/\$/\\\$/g' | sed "s/'/\\'/g" >> $FILENEW

		cat $FILE  | tr "\t" "\n" | awk '{print $0}' |
		sed 's/"/\\"/g' | sed 's/\$/\\\$/g' | sed "s/'/\\'/g"  >> $FILENW
		echo "$Fok  piped to $FILENW"
	else
		cat $FILE  | tr "\t" "\n" | awk '{print $0}' |
		sed 's/"/\\"/g' | sed 's/\$/\\\$/g' | sed "s/'/\\'/g"
	fi
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.escaper.sh  [ACTIVE] y

