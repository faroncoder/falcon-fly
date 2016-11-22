#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

DATABASE=$1
TABLE=$2
YES=$3
FILE="fm.insert.bulk-$YES.sh"
> $FILE
if [[ "$3" == "" ]]; then 
	_info="$CHR24"; _comment="Which extension of files to be mediainfo-ed?"
	read YES
fi

GET=( `ls $PWD/*$YES ` );

TOTAL=`echo "${GET[@]}" | wc -w`
COUNT=0

	 X="x"
	 C=":"
	 H="-"
for j in "${GET[@]}"; do 
	COUNT=`echo "$COUNT + 1" | bc `
	mediainfo $j > data.list; 
	HEG=`grep 'Display aspect ratio' data.list | 
	cut -d':' -f3 | 
	sed 's/ //g' `; 

	WID=`grep 'Display aspect ratio' data.list |
	 cut -d':' -f2 | 
	 sed 's/ //g'`; 
	

	ASPECT="$WID$C$HEG"
	 if [[ "$ASPECT" == ":" ]]; then
	 	ASPECT="null"
	 fi

	 WIDTH=`grep 'Width' data.list | 
	 cut -d":" -f2 | 
	 sed 's/ pixels//g' | 
	 sed 's/ //g'  `; 

	 HEIGHT=`grep 'Height' data.list | 
	 cut -d":" -f2 | 
	 sed 's/ pixels//g' | 
	 sed 's/ //g' `; 

	 ACTUALASP=`echo "scale=4; $WIDTH / $HEIGHT" | bc`
	 CALASP=`echo "scale=4; $WID / $HEG" | bc `


	PIXEL="$WIDTH$X$HEIGHT"
	 if [[ "$PIXEL" == "x" ]]; then
	 	PIXEL="null"
	 fi
 

	 DURA=`grep 'Duration' data.list | 
	 cut -d":" -f2 | 
	 head -n 1 | 
	 sed 's/ //g'`; 


	 if [[ "$DURA" == "" ]]; then
	 	DURA="null"
	 fi


	 SIZE=`grep 'File size' data.list | 
	 cut -d':' -f2 | 
	 sed 's/ //g'`; 

	 LOC1=`grep 'Complete name' data.list | 
	 head -n 1 | 
	 cut -d':' -f2 | 
	 sed 's/.mp4//g' | 
	 sed 's/ //g'`; 
	LOC=`basename $LOC1`

	 echo "fm.insert $DATABASE $TABLE identity:$LOC aspect:$ASPECT ratio:$CALASP pixel:$PIXEL calcuated:$ACTUALASP duration:$DURA size:$SIZE" >> $FILE 2> /dev/null
_send=$CHR23; _comment="$COUNT:$TOTAL"
_FY


	done
rm data.list
#echo "db.$2.insert( { $QUERY } )" | mongo $1 --quiet 2>/dev/null

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] fm.insert.sh  [ACTIVE] y

