#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN

THISFUILE="/tmp/$( uuid )"



makelister(){
		NUMB=$( cat $THISFUILE | wc -l )
		N=0
		while read line; do
			N=$( echo $(( $N + 1 )) )
			echo -e "$Fyellow$N$Foff $line"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$Fblue $NUMB $Foff"
}



if [[ ! -z "$2" ]]; then
		apt-cache search $1 | grep "$2" > $THISFUILE
		makelister
	 	echo -e "$Finfo Key searched $Fyellow $1 $2 $Foff"


elif [[ ! -z "$3" ]]; then
		apt-cache search $1 | grep "$2" | grep "$3"  > $THISFUILE
		makelister
	 	echo -e "$Finfo Key searched $Fyellow $1 $2 $3 $Foff"

else
		apt-cache search $1  > $THISFUILE
		makelister
	 	echo -e "$Finfo Key searched $Fyellow $1 $Foff"

fi


echo -n "Item to install ? "
read ITEM

if [[ "$ITEM" == "" ]]; then
	XeF
fi

while :
	do
	case "$ITEM" in
		$ITEM)
				for itemgrab in "${ITEM[@]}"; do
				ff.apt.fetch "$( awk "NR==$itemgrab" $THISFUILE | awk '{ print $1 }' )";
				done
				break
		;;
		*)
				exit 0
		;;
	esac

done


# 	fi
# if [[ -z ! "$2" ]] && [[ -z ! "$3" ]]; then
# 	cat $THISFUILE | grep "$2" | grep "$3"

# 	fi

# 	cat $THISFUILE
# 	echo -e "$Finfo Key searched \"$Fyellow $1 $Foff\""
# elif [[ -z ! "$3" ]];



# 	if [[ ! "$4" ]]; then
# 		cat $THISFUILE | grep "$2" | grep "$3"
# 			else
# 		echo -e "$Fred KNOCK IT OFF! $Foff"
# 		exit 1
# 	fi

# 	if [[ ! "$3" ]]; then
# 			fi



# fi



# if [[ "$3" != "" ]]; then
# 	grep \"$2\" | grep \"$3\" $THISFUILE
# fi
# # parma="$1"
# # for arg in "${NEWBULK[@]}";
# # 			do
# # 				parma="$parma | grep '$arg'"
# # 			done

# #LOADAPP=( $( $OPEN $parma | sort | sed 's/^/|/g' ))

# LOADAPP=$( $SUDO $CMD  )
# GETPROCESSED=( $( echo "${LOADAPP[@]}" | sed 's/|/\n|/g' | awk '{ gsub("-", "=", $2); print $0 }' | sed '1d' ) )
# echo "${GETPROCESSED[@]}" | tr '|' '\n'

# # echo -e "$( echo -e \"${GETPROCESSED[@]}\" | sed 's/|/\n$BGreen /g' | sed 's/=/$Color_Off\ =\ /g' )" >> $HOMEtmp/apt-get.list
# # while read line;
# # 	do
# # 		echo -e $line
# # 	done < $HOMEtmp/apt-get.list

# #echo -e "${GETPROCESSED[@]}" | sed 's/|/$BGreen/g' | sed 's/=/$Color_Off\ =\ /g' )
# # while read -r -d ' - ';
# # 	do
# # 		apts+=("$elements")
# # 	done < < `$( eval $OPEN $parma )`
# # #echo ${array[@]} | awk '"\n"{print $1}'
# # #IFS=$'\n' read -a element <<< "${array[@]}"
# # #appname=( `echo ${array[@]} | awk '{print $1}' `)
# # echo ${apts[@]}


# #echo "${element[@]}"
# # for line in "${element[@]}";
# # 	do
# # 		echo "$line"
# # 	done
# # done


# # while read $GETAPP
# # 	do
# # 		printf "$i :: $line"
# # 		i=`$i+1`
# # 	done
# #TOTAL="$( echo ${OUTTO[@]} | wc -l )"
# #TOTAL="$( `echo ${GETAPP[@]} | tr '|' '\n' | awk '{print $1}' | wc -l `)"
# #echo -e $GETLIST




#BULKED=( `echo "${GETPROCESSED[@]}" | tr '|' '\n' | awk '{print $1}' ` )
#SORTED=$( echo "${BULKED[@]}" | wc --words )
#echo -e "Packages found:$Fgreen $NUMB $Foff"
#echo -n "Proceed to installation?  [y]es or [n]"
#read NEXTCOMM
#if [[ "$NEXTCOMM" == "y" ]];
#	then
#		for pull in "${BULKED[@]}";
#			do
##				sudo apt-get build-dep $pull
##				sudo apt-get install -y --force-yes $pull
#			done
#fi


################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y
