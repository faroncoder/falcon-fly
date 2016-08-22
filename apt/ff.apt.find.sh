RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
if [[ "$1" != "" ]]; then
#################### BEGIN

GETPACK=''
KEYWORD="$@"

while :
	do
	case "$1" in
		$1)
			GETPACK=( $GETPACK $1 )
			if [ "$2" = '' ]; then
#				shift
				break
			else
				shift
			fi
		;;
	esac
done

THISFUILE="/tmp/$( uuid )"

if [[ "$KEYWORD" == "" ]]; then
		echo -e "$Fno -- exiting"	
		XeF
elif [[ "$KEYWORD" == " " ]]; then
		echo -e "$Fno -- exiting"	
		XeF
fi

	if [[ ! -z "$2" ]]; then
			apt-cache search $1 | grep "$2" > $THISFUILE
#			echo $KEYWORD >> $THISFUILE
	elif [[ ! -z "$3" ]]; then
			apt-cache search $1 | grep "$2" | grep "$3"  > $THISFUILE
#			echo $KEYWORD >> $THISFUILE
	else
			apt-cache search $1  > $THISFUILE
#		 	KEYWORD="$1"
fi

checkList(){ 
if [[ $G == $NUMB ]]; then
	echo -e -n "$Fstat New search keyword: "
	read NEWSEARCH
	ff.apt.find `echo $NEWSEARCH`
	XeF
fi
}


makelister(){
		echo -e "$Fyellow ### $Foff PACKAGES LISTING $Fyellow####$Foff"
		NUMB=$( cat $THISFUILE | wc -l )
		if [[ "$NUMB" == 0 ]]; then
			exit 0
		fi
		N=0
		while read line; do
			N=$( echo $(( $N + 1 )) )
			NAMEPF="`echo $line | awk '{print $1}'`"
			DESPPF="`echo $line | awk '{$1= ""; print $0}'`"
			echo -e "$Fred$N $Fgreen$NAMEPF$Fyellow$DESPPF$Foff"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$Fblue $NUMB $Foff"
}


pickProcesser(){


echo -e "$Finfo Keyword searched: $Fred $KEYWORD $Foff"
	echo -n -e "Item to install ? "
	#read -s -N 1 SELECT
	read  PICK



if [[ "${PICK[@]}" == "" ]] || [[ "${PICK[@]}" == " " ]]; then
		echo -e "$Fno -- exiting"
		XeF
else

PICKS=( $( echo ${PICK[@]} ) )


G=0
F=0
	for pickme in "${PICKS[@]}"; do
		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME="`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `"

		echo -e "$Finfo fetching $Fteal$WHOME$Foff";
		ff.apt.fetch $WHOME
		echo "----------------------------------------------------"	
		DPKG=`dpkg -l | grep -w "$WHOME" | awk '{ print $2 }'`
			if [[ "$DPKG" == "$WHOME" ]]; then
			G=`echo $(( $G + 1 ))`
			echo -e "[ $Fgreen INSTALLED$Foff ] $Fyellow $WHOME $Foff | Installed:$Fgreen$G$Foff | Not installed:$Fred$FO$Foff"
		else
			F=`echo $(( $F + 1 ))`
			echo -e "[$Fred NOT INSTALLED$Foff ] $WHOME | $Fyellow Installed: $Fgreen$G$Foff | $Fyellow Not installed:$Fred$FO$Foff"
			fi
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

#	if [[ "$SELECT" == $"" ]] || [[ "$SELECT" == $"" ]]; then do echo -e "$Finfo No package	
#	if [[ "$SELECT" == "" ]] || [[ "$SELECT" == "" ]]; then do echo -e "$Finfo No package is selected - exiting"; XeF ; done; fi

#aptMenu

menuEngine

################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "$Fyellow enter keyword to search the repository $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

