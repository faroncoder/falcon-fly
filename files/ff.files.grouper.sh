#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
#if [[ "$1" != "" ]]; then
#################### BEGIN


##NUMBERS ONLY
MEXT=`uuid |  sed 's/[A-Za-z]*//g' | sed 's/-//g' | rev | awk '{print substr($1,0,5) }'`

orderfiles=( `find . -maxdepth 1 -type f ! -name '.*'` )
for line in "${orderfiles[@]}"; do		
	GETB=`basename $line`
	GET=`echo "$GETB" | cut -d'.' -f1`
	## ABC ONLY 
	LET=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`
	rename "s/$GET/$LET/g" $line
done

echo -e "$Fok"
#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
#cd $RETURN 1> /dev/null;
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

