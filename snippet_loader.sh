#!/bin/bash
if [[ ! "$( echo  | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
 ####################START

LOC="$FALCON/files/snippets"

FILE=`basename $1`
EXT=`echo $FILE | rev | cut -d'.' -f1 | rev`
NAME=`echo $FILE | sed "s/.$EXT//g"`

function goCountUp() {
	COUNT=`echo "$COUNT + 1" | bc `
}
COUNT=0
FOUNDS=( ` find $LOC -type  f -name "*$NAME*" -exec basename {} \;  ` )
	
		for file  in "${FOUNDS[@]}"; do
			COUNT=`echo "$COUNT + 1" | bc `
			ASSI=""
			FILE$COUNT="$file"
			echo -e "$b_teal $COUNT$clear - $file "
		done8

		echo -e -n "[${b_yellow}$CHR119{$clear}] Which file to proceed with ?"
		read CHOCIE
		while : ; do
		PICK="$CHOICE"
			case "$CHOICE" in
					$PICK)  echo -e "File has been picked: `echo $FILE$PICK`" ; break ;;
					*) break ;;
			esac
		done
						





# if [[ -f "$LOC" = "" ]]; then
# 	less $LOC | awk '/LINE/,/MARK/' | sed '/LINE/d' | sed '/MARK/d' | grep '\${[0-9]:' | sed 's/\$/\n\$/g' | sed 's/}/}\n/g' | grep '${' | sort | uniq | sed 's/\$//g' | sed 's/ //g'
# fi





####################STOP
doneTime
### [FILE] FILENAME  [ACTIVE] y
		