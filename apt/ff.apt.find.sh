#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

loadSudo
#KEYWORD=( $@ )

THISFUILE="/tmp/`uuid`"
KEYWORD="$1 $2 $3"

if [[ "$KEYWORD" == "" ]]; then
		echo -e "$_no -- exiting"	
		doneTime
elif [[ "$KEYWORD" == " " ]]; then
		echo -e "$_no -- exiting"	
		doneTime
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
	_send="$CHR182"; _comment="New search keyword: "
	_FR
	read NEWSEARCH
	ff.apt.find $NEWSEARCH
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
			N=`echo "$N + 1" | bc `
			NAMEPF=`echo $line | awk '{print $1}'`
			DESPPF=`echo $line | awk '{$1= ""; print $0}'`
			echo -e "$b_red$N $b_green$NAMEPF$b_yellow$DESPPF$clear"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$b_blue $NUMB $clear"
}


pickProcesser(){
	_send="$CHR23"; _comment="Keyword searched: $b_red $KEYWORD $clear"
	_FT
	#echo -n -e "Item to install ? "
	#echo -e ""
	_comment="Item to install? "
	_stat; #read PICKS
	
	#CHECKALL=( ${PICKS} )
	
	read  PICKS
	CHECKALL=( ${PICKS} )

# if [[ "${CHECKALL[@]}" == "" ]] || [[ "${CHECKALL[@]}" == " " ]]; then
if [[ "${CHECKALL[@]}" == "" ]]; then
		_comment="no -- exiting. "
		_FR
		#echo -e "$_no -- exiting"
		doneTime
else

G=0
F=0
	for pickme in "${CHECKALL[@]}"; do
#		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME=`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `
		#_comment="
		COLLECT="$COLLECT $WHOME"
	done
		_comment="${COLLECT}"
		_stat "${COLLECT}"
#
	$SUDO apt-get build-dep ${COLLECT} 2> /dev/null < /dev/null
	$SUDO apt-get install -y --force-yes ${COLLECT} 2> /dev/null < /dev/null
	
		# fetching $b_teal$WHOME$clear";
		#source /usr/local/bin/ff.apt.verify $WHOME
		#source /usr/local/bin/ff.apt.fetch $WHOME
		# echo "----------------------------------------------------"	
#		

		#DPKG=`dpkg -l | grep -w "$WHOME" | awk '{ print $2 }'`
#			if [[ "$DPKG" == "$WHOME" ]]; then
#			G=`echo $(( $G + 1 ))`
#			echo -e "[ $b_green INSTALLED$clear ] $b_yellow $WHOME $clear | Installed:$b_green$G$clear | Not installed:$b_red$FO$clear"
#		else
#			F=`echo $(( $F + 1 ))`
#			echo -e "[$b_red NOT INSTALLED$clear ] $WHOME | $b_yellow Installed: $b_green$G$clear | $b_yellow Not installed:$b_red$FO$clear"
#			fi
	# 	pickme=""
	# 	WHOME=""
	# done


fi
menuEngine
}



menuEngine(){
	makelister
	pickProcesser
}


#	while :
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

#	if [[ "$SELECT" == $"" ]] || [[ "$SELECT" == $"" ]]; then do _infoNo package	
#	if [[ "$SELECT" == "" ]] || [[ "$SELECT" == "" ]]; then do echo -e "_info No package is selected - exiting"; doneTime ; done; fi

#aptMenu

menuEngine

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.find.sh  [ACTIVE] y

