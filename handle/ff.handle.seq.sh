#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

if [[ "$1" == "" ]]; then
	PATHD=$PWD
else
	PATHD="$1"
	cd $PATHD 1> /dev/null
fi
if [[ "$2" == "" ]]; then
	MEXT=0
else
	MEXT=$2
fi

GETALL=( ` find $PATHD -maxdepth 1 -type f -exec basename {} \;` )
COUNT=`echo "${GETALL[@]}"  | wc -w`
for seqfile in "${GETALL[@]}"; do
	NEWNAME="$( seq -w 0000 $MEXT | tail -n 1 )"
	PREEX=`echo $seqfile | rev | cut -d'.' -f1 | rev`
	rename "s/$seqfile/$NEWNAME.$PREEX/g" "$seqfile"
	echo "${_warn} $seqfile --> $NEWNAME.$PREEX "
	MEXT=`echo $(( $MEXT + 1 ))`
done

echo "${_stat} $COUNT files ==> $MEXT seqfile"

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.seq.sh  [ACTIVE] y

