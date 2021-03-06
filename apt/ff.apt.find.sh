#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

loadSudo
#KEYWORD=( $@ )

THISFUILE="/tmp/`uuid`"
KEYWORD="$1 $2 $3"

if [[ "$KEYWORD" == "" ]]; then
		echo -e "$Fno -- exiting"
		XeF
elif [[ "$KEYWORD" == " " ]]; then
		echo -e "$Fno -- exiting"
		XeF
fi

	if [[ ! -z "$2" ]]; then
			apt-cache search $1 | grep "$2" > $THISFUILE
#			KEYWORD="$1 $2" # >> $THISFUILE
	elif [[ ! -z "$3" ]]; then
			apt-cache search $1 | grep "$2" | grep "$3"  > $THISFUILE
#			KEYWORD="$1 $2 $3" # >> $THISFUILE

	else
			apt-cache search $1  > $THISFUILE
#		 	KEYWORD="$1" # >> $THISFUILE

fi

checkList(){
if [[ $G == $NUMB ]]; then
	_commend=" New search keyword: "
	_stat
	read ACTION
	ff.apt.find $ACTION
	doneTime
fi
}


makelister(){
		echo ""
		NUMB=` cat $THISFUILE | wc -l `
		if [[ "$NUMB" == 0 ]]; then
			exit 0
		fi
		N=0
		while read line; do
			N=`echo $(( $N + 1 ))`
			NAMEPF=`echo $line | awk '{print $1}'`
			DESPPF=`echo $line | awk '{$1= ""; print $0}'`
			echo -e "$b_red$N $b_green$NAMEPF$b_yellow$DESPPF$reset"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$b_blue $NUMB $reset"
}


pickProcesser(){

	_comment="Keyword searched: $b_red $KEYWORD $reset"
	_info
	read  PICKS
	CHECKALL=( `echo ${PICKS}` )

if [[ "${CHECKALL[@]}" == "" ]] || [[ "${CHECKALL[@]}" == " " ]]; then
		_comment="no -- exiting";
		_FR
		doneTime
else

G=0
F=0
	for pickme in "${CHECKALL[@]}"; do
#		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME=`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `
		_comment="fetching $b_teal$WHOME$reset"; _info

		# /usr/local/bin/ff.apt.verify $WHOME
		#ff.apt.fetch $WHOME
		echo "----------------------------------------------------"
#

		#DPKG=`dpkg -l | grep -w "$WHOME" | awk '{ print $2 }'`
#			if [[ "$DPKG" == "$WHOME" ]]; then
#			G=`echo $(( $G + 1 ))`
#			echo -e "[ $b_green INSTALLED$reset ] $b_yellow $WHOME $reset | Installed:$b_green$G$reset | Not installed:$b_red$FO$reset"
#		else
#			F=`echo $(( $F + 1 ))`
#			echo -e "[$b_red NOT INSTALLED$reset ] $WHOME | $b_yellow Installed: $b_green$G$reset | $b_yellow Not installed:$b_red$FO$reset"
#			fi
		pickme=""
		WHOME=""
	done


fi
menuEngine
}



menuEngine(){
	makelister
	pickProcesser
}

menuEngine

_send=$CHR23; _comment="Keyword searched: $b_red $KEYWORD $reset" 
_FB 
echo -n -e "Item to install ? "
	while :0
#		do
#			case "$pickme" in
#				$pickme)
#					ff.apt.fetch "$( awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' )";
#					break
#				;;
#			esac
#		done
#done

#aptMenu
#}

#	if [[ "$SELECT" == $"" ]] || [[ "$SELECT" == $"" ]]; then do echo -e "$Finfo No package
#	if [[ "$SELECT" == "" ]] || [[ "$SELECT" == "" ]]; then do echo -e "$Finfo No package is selected - exiting"; XeF ; done; fi

#aptMenu



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.find.sh  [ACTIVE] y

