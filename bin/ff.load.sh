#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN


LOC="/mnt/falcon/scripts"; if [ ! -d "$LOC" ]; then  LOC="/home/faron/.falcon/scripts"; fi

VAR=$1
FILEHUNT=( $( find "$LOC"  -type f  -name '*.sh'  -name "*$VAR*" ! -path '*/.git/*'  ) );

makelink(){
			FILE=$( basename $entry )
			EXT=$( echo $FILE | sed 's/.sh//g' )
			find -L /usr/local/bin -type f -name "*$EXT*" -exec rm {} \;
			fcm="OK"; echo -e "[$fcc$fcm$fco]: bin sync-ed";
			cd /usr/local/bin 1> /dev/null;
			find /mnt/falcon/scripts -type f -name 'ff.*' -name '*.sh' -exec ln -s {} \;
			rename 's/.sh//g' *
			fcm="OK"; echo -e "[$fcc$fcm$fco]: $FILE linked";
}

if [ ! "$FILEHUNT" ];  then

	$fcm="ERR"
	echo -e "[$fcr$fcm$fco] None found"
	exit 1
else
	for entry in "${FILEHUNT[@]}"; do
		SELECT=""
			while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
				echo "${FILEHUNT[@]}"
				echo "Proceed?  [g] to proceed"
    				IFS= read -s -n 1 SELECT

				 	case "$SELECT" in
				 	# 	n) newHTML break ;;
						# i) ff.ip break ;;
						# j) jscInit break ;;
						# s) statusGet break ;;
						# a) loadAJAX break ;;
						# x) echo "exiting spawner"; break ;;
						g ) makelink ; break;;
						* ) echo "exiting unchanged"; break;;
					esac
			done
	done
fi

################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

