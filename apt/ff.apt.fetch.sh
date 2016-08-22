RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
if [[ "$1" != "" ]]; then
#################### BEGIN

PACKS="$@"

#STRINGCOL=''
#while :
#	do
#	case "$1" in
#		$1)
#			STRINGCOL="$STRINGCOL $1"
#			if [ "$2" = '' ]; then
#				shift
#				break
#			else
#				shift
#			fi
#		;;
#	esac
#done


appGo(){
#		logger "FARON:: apt-get package recorded for installation = $appget "
		/usr/local/bin/ff.apt.build $appget
		sudo apt-get install -y $appget --force-yes 2> /dev/null;
		appget=""
}


APID="$( uuid )_f"

$SUDO rm /var/lib/dpkg/lock; sudo dpkg --configure -a; 2> /dev/null;


	for appget in "${PACKS[@]}"; do
		appGo
	done


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
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "$Fyellow enter keyword to search the repository $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

