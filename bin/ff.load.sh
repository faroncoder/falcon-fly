#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

LOC="/home/users/faron/.falcon/scripts"; if [ ! -d "$LOC" ]; then  echo -e "$Fno Falcon is not mounted. Exiting"; exit 1;   fi

VAR=$1
FILEHUNT=( ` find $LOC -type f -name 'ff.*' ! -path '*/.git/*' ` );

echo -e "$Finfo $( echo "${FILEHUNT[@]}" | wc -w )"

makelink(){
			FILE=`basename $entry`
			EXT=$( echo $FILE | sed 's/.sh//g' )
			cd /usr/local/bin 1> /dev/null
			rm "ff.*" 2> /dev/null
#			echo -e "$Finfo Falcon Bin sync-ed."
			ln -s "$entry" "$EXT" 2>/dev/null
# 			echo -e "$Fok $FILE linked";
}

if [[ -z "$FILEHUNT" ]];  then
	echo -e "$Fno None found"
	XeF
else
	for entry in "${FILEHUNT[@]}"; do
		makelink;
	done
	# 	SELECT=""
	# 		while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
	# 			echo "${FILEHUNT[@]}"
	# 			echo -e "$Finfo Proceed?  [g] to proceed"
 #    				IFS= read -s -n 1 SELECT
	# 			 	case "$SELECT" in
	# 					g ) makelink ; break;;
	# 					* ) echo "exiting unchanged"; break;;
	# 				esac
	# 		done
	 # done
fi
source ~/.profile
echo -e "$Fok Falcon Bin sync-ed."

#echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
cd $RETURN 1> /dev/null
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

