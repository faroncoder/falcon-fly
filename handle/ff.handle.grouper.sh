#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

##NUMBERS ONLY
#MEXT=`uuid |  sed 's/[A-Za-z]*//g' | sed 's/-//g' | rev | awk '{print substr($1,0,5) }'`

orderfiles=( `find . -maxdepth 1 -type f ! -name '.*' ! -name '*.sh' ` )
for line in "${orderfiles[@]}"; do		
	GETB=`basename $line`
	GET=`echo "$GETB" | cut -d'.' -f1`
	## ABC ONLY 
	LET=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
	rename "s/$GET/$LET/g" $GETB
done

echo -e "${_ok}"
#echo -e ${_ok}"$Fyellow $( basename $0 ) $Foff"

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.grouper.sh  [ACTIVE] y

