#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader;
 #################### START


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
	echo -e -n "_stat New search keyword: "
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
			N=`echo $(( $N + 1 ))`
			NAMEPF=`echo $line | awk '{print $1}'`
			DESPPF=`echo $line | awk '{$1= ""; print $0}'`
			echo -e "$b_red$N $b_green$NAMEPF$b_yellow$DESPPF$clear"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$b_blue $NUMB $clear"
}


pickProcesser(){

	echo -e "_info Keyword searched: $b_red $KEYWORD $clear"
	echo -n -e "Item to install ? "
	read  PICKS
	CHECKALL=( $PICKS )

if [[ "${CHECKALL[@]}" == "" ]] || [[ "${CHECKALL[@]}" == " " ]]; then
		echo -e "$_no -- exiting"
		doneTime
else

G=0
F=0
	for pickme in "${PICKS[@]}"; do
#		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME=`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `
		echo -e "_info fetching $b_teal$WHOME$clear";
		 /usr/local/bin/ff.apt.verify $WHOME
		# /usr/local/bin/ff.apt.fetch $WHOME
		echo "----------------------------------------------------"	
#		

		#DPKG=`dpkg -l | grep -w "$WHOME" | awk '{ print $2 }'`
#			if [[ "$DPKG" == "$WHOME" ]]; then
#			G=`echo $(( $G + 1 ))`
#			echo -e "[ $b_green INSTALLED$clear ] $b_yellow $WHOME $clear | Installed:$b_green$G$clear | Not installed:$b_red$FO$clear"
#		else
#			F=`echo $(( $F + 1 ))`
#			echo -e "[$b_red NOT INSTALLED$clear ] $WHOME | $b_yellow Installed: $b_green$G$clear | $b_yellow Not installed:$b_red$FO$clear"
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
#	if [[ "$SELECT" == "" ]] || [[ "$SELECT" == "" ]]; then do echo -e "_info No package is selected - exiting"; doneTime ; done; fi

#aptMenu

menuEngine
####################STOP
doneTime
### [FILE] ff.apt.find.sh [ACTIVE] y
