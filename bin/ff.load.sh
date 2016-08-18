#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN

LOC="/home/users/faron/.falcon/scripts"; if [ ! -d "$LOC" ]; then  echo -e "$Fno Falcon is not mounted. Exiting"; exit 1;   fi

FILEHUNT=( ` find $LOC -type f -name 'ff.*' ! -path '*/.git/*' ` );

echo -e "$Finfo $( echo "${FILEHUNT[@]}" | wc -w )"

makelink(){
			FILE=`basename $entry`
			EXT=$( echo $FILE | sed 's/.sh//g' )
			cd /usr/local/bin 1> /dev/null
			/bin/rm "ff.*" 2> /dev/null
			ln -s "$entry" "$EXT" 2>/dev/null
}

if [[ -z "$FILEHUNT" ]];  then
	echo -e "$Fno None found"
	XeF
else
	for entry in "${FILEHUNT[@]}"; do
		makelink;
	done
fi
source ~/.profile
echo -e "$Fok Falcon Bin sync-ed."

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/bin/ff.load.sh  [ACTIVE] y
