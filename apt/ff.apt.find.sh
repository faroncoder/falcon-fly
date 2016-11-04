#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START


#KEYWORD=( $@ )

THISFUILE="/tmp/`uuid`"
KEYWORD="$1 $2 $3"

if [[ "$KEYWORD" == "" ]]; then
		echo -e "${_no} -- exiting"	
		XeF
elif [[ "$KEYWORD" == " " ]]; then
		echo -e "${_no} -- exiting"	
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
	echo -e -n "${_stat} New search keyword: "
	read NEWSEARCH
	ff.apt.find $NEWSEARCH
	XeF
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
			echo -e "$Fred$N $Fgreen$NAMEPF$Fyellow$DESPPF$Foff"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$Fblue $NUMB $Foff"
}


pickProcesser(){

	echo -e "${_info} Keyword searched: $Fred $KEYWORD $Foff"
	echo -n -e "Item to install ? "
	read  PICKS
	CHECKALL=( $PICKS )

if [[ "${CHECKALL[@]}" == "" ]] || [[ "${CHECKALL[@]}" == " " ]]; then
		echo -e "${_no} -- exiting"
		XeF
else

G=0
F=0
	for pickme in "${PICKS[@]}"; do
#		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME=`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `
		echo -e "${_info} fetching $Fteal$WHOME$Foff";
		source /usr/local/bin/ff.apt.verify $WHOME
		#source /usr/local/bin/ff.apt.fetch $WHOME
		echo "----------------------------------------------------"	
#		

		#DPKG=`dpkg -l | grep -w "$WHOME" | awk '{ print $2 }'`
#			if [[ "$DPKG" == "$WHOME" ]]; then
#			G=`echo $(( $G + 1 ))`
#			echo -e "[ $Fgreen INSTALLED$Foff ] $Fyellow $WHOME $Foff | Installed:$Fgreen$G$Foff | Not installed:$Fred$FO$Foff"
#		else
#			F=`echo $(( $F + 1 ))`
#			echo -e "[$Fred NOT INSTALLED$Foff ] $WHOME | $Fyellow Installed: $Fgreen$G$Foff | $Fyellow Not installed:$Fred$FO$Foff"
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

#	if [[ "$SELECT" == $"" ]] || [[ "$SELECT" == $"" ]]; then do echo -e "${_info} No package	
#	if [[ "$SELECT" == "" ]] || [[ "$SELECT" == "" ]]; then do echo -e "${_info} No package is selected - exiting"; XeF ; done; fi

#aptMenu

menuEngine

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apt.find.sh  [ACTIVE] y

