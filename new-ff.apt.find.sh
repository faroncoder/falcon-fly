#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader;
 #################### START


#KEYWORD=( $@ )

THISFUILE="/tmp/`uuid`"
KEYWORD="$1 $2 $3"

if [[ "$KEYWORD" == "" ]]; then
		echo -e "$_no -- exiting"	
		XeF
elif [[ "$KEYWORD" == " " ]]; then
		echo -e "$_no -- exiting"	
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
	echo -e -n "_stat New search keyword: "
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
			echo -e "$b_red$N $b_green$NAMEPF$b_yellow$DESPPF$reset"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$b_blue $NUMB $reset"
}


pickProcesser(){

	echo -e "_info Keyword searched: $b_red $KEYWORD $reset"
	echo -n -e "Item to install ? "
	read  PICKS
	CHECKALL=( $PICKS )

if [[ "${CHECKALL[@]}" == "" ]] || [[ "${CHECKALL[@]}" == " " ]]; then
		echo -e "$_no -- exiting"
		XeF
else

G=0
F=0
	for pickme in "${PICKS[@]}"; do
#		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME=`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `
		echo -e "_info fetching $b_teal$WHOME$reset";
		source /usr/local/bin/ff.apt.verify $WHOME
		#source /usr/local/bin/ff.apt.fetch $WHOME
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

#	if [[ "$SELECT" == $"" ]] || [[ "$SELECT" == $"" ]]; then do echo -e "_info No package	
#	if [[ "$SELECT" == "" ]] || [[ "$SELECT" == "" ]]; then do echo -e "_info No package is selected - exiting"; XeF ; done; fi

#aptMenu

menuEngine
####################STOP
doneTime
### [FILE] ff.apt.find.sh [ACTIVE] y
