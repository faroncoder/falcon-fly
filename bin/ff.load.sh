#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcm="OK";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
if [ ! -z "$1" ]; then
#################### BEGIN
LOC="/mnt/falcon/scripts"; if [ ! -d "$LOC" ]; then  LOC="/home/faron/.falcon/scripts"; fi

VAR=$1
FILEHUNT=( $( find "$LOC"  -type f  -name '*.sh'  -name "*$VAR*" ! -path '*/.git/*'  ) );

makelink(){
			FILE=$( basename $entry )
			EXT=$( echo $FILE | sed 's/.sh//g' )
			find /usr/local/bin -type l -name "*$EXT*" -exec rm {} \;
			fcm="OK"; echo -e "[$fcc$fcm$fco]: bin sync-ed";
			ln -s "$entry" "/usr/local/bin/$EXT" 2>/dev/null
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
#cd $RETURN
else fcm="ERROR"; echo -e "[$fcr$fcm$fco]: path of file you want to load"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

