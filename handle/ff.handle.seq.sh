#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

if [[ "$1" == "" ]]; then
	MEXT=0
else
	MEXT=$1
fi

cp -r $PWD /tmp/backup/

GETALL=( ` find $PWD -maxdepth 1 -type f -exec basename {} \;` )
COUNT=`echo "${GETALL[@]}"  | wc -w`
for seqfile in "${GETALL[@]}"; do
	NEWNAME="$( seq -w 0000 $MEXT | tail -n 1 )"
	PREEX=`echo $seqfile | rev | cut -d'.' -f1 | rev`
	rename "s/$seqfile/$NEWNAME.$PREEX/g" $seqfile
	echo "$Fok $seqfile --> $NEWNAME.$PREEX "
	MEXT=`echo $(( $MEXT + 1 ))`
done

echo "$Fstat $COUNT files ==> $MEXT seqfile"

################### END
#cd $RETURN 1> /dev/null;
#else echo "$Fno $Fred Arg 1 $Foff=$Fyellow "" $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.seq.sh [ACTIVE] y


