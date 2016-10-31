#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

LOC="/home/users/faron/.falcon/scripts";


if [[ ! -d "$LOC" ]]; then
		echo "$Fno Falcon is not mounted. Exiting"
		XeF
	else

	if [[ "$1" != "" ]]; then
		FILEHUNT=( `find $LOC -type f -name "*$1*" ! -path '*/.git/*' ` )
	else
		FILEHUNT=( ` find $LOC -type f -name 'ff.*' ! -path '*/.git/*' ` );
	fi

	echo "$Finfo $( echo "${FILEHUNT[@]}" | wc -w )"



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
		find -L /usr/local/bin -name 'ff.*' -exec rm {} \;
		for entry in "${FILEHUNT[@]}"; do
				makelink;
		done
	fi
	source $HOME/.bashrc
	echo "$Fok Falcon Bin sync-ed."
fi

#checkTime

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.folders.memory.sh [ACTIVE] y


