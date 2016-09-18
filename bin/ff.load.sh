#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN

LOC="/home/users/faron/.falcon/scripts";
find -L /usr/local/bin -name 'ff.*' -exec rm {} \;

if [[ ! -d "$LOC" ]]; then  
		echo "$Fno Falcon is not mounted. Exiting"
		XeF
	else

	if [[ "$1" != "" ]]; then
		FILEHUNT=( `find $LOC -type f -name "*$1*" ! -path '*/.git/*' ` )
	else
		FILEHUNT=( ` find $LOC -type f -name 'ff.*' ! -path '*/.git/*' ` );
	fi

	echo -e "$Finfo $( echo "${FILEHUNT[@]}" | wc -w )"
	
	

	makelink(){
				EXT=".`echo $entry | rev | cut -d'.' -f1 | rev`"
				FILEBODY=`echo $entry | sed "s/$EXT//g"`
				NEWHOME=`basename $FILEBODY`
				BINLOC="/usr/local/bin/$NEWHOME"
				#echo "$entry --> $BINLOC" 
				ln -s "$entry" "$BINLOC"					
	}

	if [[ -z "$FILEHUNT" ]];  then
		echo "$Fno None found"
		XeF
	else
		for entry in "${FILEHUNT[@]}"; do
				makelink;
		done
	fi
	source $HOME/.profile
	echo -e "$Fok Falcon Bin sync-ed."
fi

################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/bin/ff.load.sh  [ACTIVE] y
