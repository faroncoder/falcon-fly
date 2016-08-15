#!/bin/bash
<<<<<<< HEAD
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
=======
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}

#if [ "$1" != "" ]; then
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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
<<<<<<< HEAD
	sudo rm /var/lib/dpkg/lock; sudo dpkg --configure -a;

=======
<<<<<<< HEAD
	sudo rm /var/lib/dpkg/lock; sudo dpkg --configure -a;
=======
	sudo rm /var/lib/dpkg/lock;
	sudo dpkg --configure -a;
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
}

beginInstall(){
	defaultFunction
<<<<<<< HEAD
	sudo apt-get install -y $appget
	cat "/home/users/faron/.falcon/files/configs/etc_apt-get_packages.list" | uniq | sort > /tmp/aptgrab_pkg
	echo "$appget" >> /tmp/aptgrab_pkg
	less "/tmp/aptgrab_pkg" | uniq | sort > /home/users/faron/.falcon/files/configs/etc_apt-get_packages.list
	logger "FARON:: apt-get package recorded for installation = $appget "
	sudo apt-get install -y $appget --force-yes
=======
<<<<<<< HEAD
	sudo apt-get install -y  $appget
=======
<<<<<<< HEAD
	sudo apt-get install -y $appget
=======
	cat "/mnt/falcon/files/configs/etc_apt-get_packages.list" | uniq | sort > /tmp/aptgrab_pkg
	echo "$appget" >> /tmp/aptgrab_pkg
	less "/tmp/aptgrab_pkg" | uniq | sort > /mnt/falcon/files/configs/etc_apt-get_packages.list
	logger "FARON:: apt-get package recorded for installation = $appget "
	sudo apt-get install -y $appget --force-yes
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 6224fb5b175399210b72de5d5294ce9546f28ecf
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
}

beginBuild(){
	defaultFunction
<<<<<<< HEAD
	sudo apt-get build-dep -y --force-yes $appget
=======
<<<<<<< HEAD
	sudo apt-get build-dep -y $appget
=======
<<<<<<< HEAD
	sudo apt-get build-dep -y --force-yes $appget
>>>>>>> 6224fb5b175399210b72de5d5294ce9546f28ecf
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
}
beginCheck(){
	defaultFunction
	beginInstall < /dev/null >> /tmp/$APID
}
<<<<<<< HEAD
=======
=======
	sudo apt-get build-dep $appget -y --force-yes
}
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
#beginCheck(){
#	defaultFunction
#	beginInstall < /dev/null >> /tmp/$APID
#}
<<<<<<< HEAD
=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

appCheck(){
	if [ -f "/tmp/$APID" ]; then
		while read line; do
			echo $line
		done < /tmp/$APID
<<<<<<< HEAD
#	else
#		echo "no dependency needed"
#		> /tmp/$APID
=======
<<<<<<< HEAD
	else
		echo "no dependency needed"	
		> /tmp/$APID
=======
#	else
#		echo "no dependency needed"
#		> /tmp/$APID
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	fi
}

appGo(){
<<<<<<< HEAD

=======
<<<<<<< HEAD
	PACKS=( $STRINGCOL )
	for appget in "${PACKS[@]}"; do
			beginBuild
			beginCheck
			appCheck
=======
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	PACKS=( `echo ${STRINGCOL[@]}` )
	for appget in "${PACKS[@]}"; do
			beginBuild
#			beginCheck
#			appCheck
<<<<<<< HEAD
=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
			beginInstall
	done
	appget=""
}
appGo
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
# 		# GETPACK=( "$( echo \"$( sudo apt-get install $appget < /dev/null" |  sed  -n  -e '{ /Suggested packages/,/The following NEW/p }' | sed '/The following/d' )\" )" )
# 		# GETPACK=$( sudo apt-get install $appget 2< /dev/null  |  sed  -n  -e '{ /Suggested packages/,/The following NEW/p }' | sed '/The following NEW/d' | sed '/Suggested /d' )
# #echo ${GETPACK[@]}


# 		 # 	for sendto in "${GETPACK[@]}"; do
<<<<<<< HEAD
# 		 # 		# echo $sendto
=======
# 		 # 		# echo $sendto 
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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
<<<<<<< HEAD
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

=======
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.apt.fetch "
#  echo "example:    "
#fi


## TALON: ff.apt.fetch
XeF
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
