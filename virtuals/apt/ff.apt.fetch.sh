#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}

#if [ "$1" != "" ]; then
#################### BEGIN

STRINGCOL=''
while :
	do
	case "$1" in
		$1)
			STRINGCOL="$STRINGCOL $1"
			if [ "$2" = '' ]; then
				shift
				break
			else
				shift
			fi
		;;
	esac
done
# firecommand="${CMD}"
# if [[ "$EUID" != "0" ]]; then
# 			firecommand="sudo ${CMD}"
# fi
APID="$( uuid )_f"

defaultFunction(){
	sudo rm /var/lib/dpkg/lock; sudo dpkg --configure -a;

}

beginInstall(){
	defaultFunction
	sudo apt-get install -y $appget
	cat "/home/users/faron/.falcon/files/configs/etc_apt-get_packages.list" | uniq | sort > /tmp/aptgrab_pkg
	echo "$appget" >> /tmp/aptgrab_pkg
	less "/tmp/aptgrab_pkg" | uniq | sort > /home/users/faron/.falcon/files/configs/etc_apt-get_packages.list
	logger "FARON:: apt-get package recorded for installation = $appget "
	sudo apt-get install -y $appget --force-yes
}

beginBuild(){
	defaultFunction
	sudo apt-get build-dep -y --force-yes $appget
}
beginCheck(){
	defaultFunction
	beginInstall < /dev/null >> /tmp/$APID
}
#beginCheck(){
#	defaultFunction
#	beginInstall < /dev/null >> /tmp/$APID
#}

appCheck(){
	if [ -f "/tmp/$APID" ]; then
		while read line; do
			echo $line
		done < /tmp/$APID
#	else
#		echo "no dependency needed"
#		> /tmp/$APID
	fi
}

appGo(){

	PACKS=( `echo ${STRINGCOL[@]}` )
	for appget in "${PACKS[@]}"; do
			beginBuild
#			beginCheck
#			appCheck
			beginInstall
	done
	appget=""
}
appGo
# 		# GETPACK=( "$( echo \"$( sudo apt-get install $appget < /dev/null" |  sed  -n  -e '{ /Suggested packages/,/The following NEW/p }' | sed '/The following/d' )\" )" )
# 		# GETPACK=$( sudo apt-get install $appget 2< /dev/null  |  sed  -n  -e '{ /Suggested packages/,/The following NEW/p }' | sed '/The following NEW/d' | sed '/Suggested /d' )
# #echo ${GETPACK[@]}


# 		 # 	for sendto in "${GETPACK[@]}"; do
# 		 # 		# echo $sendto
# 			# 	suggestcoll=( $suggestcoll $sendto )
# 		 # 		# echo $sendto >> "~/.falcon/setup/apt-get/$( hostname -s)_suggested.list"
# 			# done
# 		fi
# 		#CMD="( `sudo apt-get install -y --force-yes $appget` )"
# 		#`$firecommand ${CMD}`
# 	done

# }


# if [[ "${suggestcoll[@]}" != "" ]]; then
#  		echo "install suggested packages too?"
#  		read REPLY
#  		if [[ "$REPLY" = y ]]; then
#  				for pack2 in "${CMD2[@]}"; do
#  					ff.apt.fetch $pack2;
#  				done
# # 		fi
# fi


################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.apt.fetch "
#  echo "example:    "
#fi


## TALON: ff.apt.fetch
XeF
