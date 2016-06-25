#!/bin/bash
<<<<<<< HEAD
source /usr/local/lib/faron_falcon/colors



# BULK=( "$@" )
# NEWBULK=( $( echo ${BULK[@]} | sed "s/$1//g" ) )
# OPEN="sudo apt-cache search"
if [[ "$UUID" != 0 ]]; then
	SUDO="sudo"
fi

# if [[  ! "$2"  ]]; then
# 	$SUDO $CMD > /tmp/listing
# else
# 	CMD="apt-cache search $1 | grep \"$2\""
# fi
# if [[  ! "$3"  ]]; then
# 		$SUDO $CMD > /tmp/listing
# else
# 	CMD="apt-cache search $1 | grep \"$2\" | grep \"$3\""
# fi

# if [[ "$4" != "" ]]; then
# 	echo -e "$Fno $Fred Too many words $Foff"
# 	exit 1
# else
# 	$SUDO $CMD > /tmp/listing
# fi

makeloader(){

	while read line; do
		N=$( echo $(( N + 1 )))
		echo -e "$Fgreen$N$Foff : $line"
	done < /tmp/listing
#	while :
# 	do
# 	case "$N" in
# 		$1)  GET=$( sed -n $1p /tmp/listing | awk '{ print $1}' ); ff.apt.fetch $GET;
# 		break
# 		;;
# 		*)
# 		break
# 		;;
# 	esac
# done
}




if [[ ! -z "$2" ]]; then
	if [[ ! -z "$3" ]]; then
		apt-cache search $1 | grep "$2" | grep "$3" > /tmp/listing
		NUMB=$( cat /tmp/listing | wc -l )
		if [[ "${NUMB[@]}" < 50 ]]; then
			cat /tmp/listing
			echo -e "Packages found:$Fgreen $NUMB $Foff"
			else
			makeloader
			echo -e "$Finfo Key searched \"$Fyellow $1 $Foff , Fgreen $2 $Foff , $Fblue $3\" $Foff"
			echo -e "Packages found:$Fgreen $NUMB $Foff"

		fi
	else
		apt-cache search $1 | grep "$2" > /tmp/listing
		NUMB=$( cat /tmp/listing | wc -l )
		if [[ "${NUMB[@]}" > 50 ]]; then
			cat /tmp/listing
			echo -e "Packages found:$Fgreen $NUMB $Foff"
			else
			makeloader
			echo -e "$Finfo Key searched $Fyellow $1 $Foff and $Fgreen $2 $Foff"
			echo -e "Packages found:$Fgreen $NUMB $Foff"
		fi
	fi
else
	apt-cache search $1 > /tmp/listing
	NUMB=$( cat /tmp/listing | wc -l )
		if [[ "${NUMB[@]}" > 50 ]]; then
			cat /tmp/listing
			echo -e "Packages found:$Fgreen $NUMB $Foff"
			echo -e "$Finfo Key searched \"$Fyellow $1 $Foff\""
			else
			makeloader
			echo -e "$Finfo Key searched \"$Fyellow $1 $Foff\""
			echo -e "Packages found:$Fgreen $NUMB $Foff"
		fi
fi

# 	fi
# if [[ -z ! "$2" ]] && [[ -z ! "$3" ]]; then
# 	cat /tmp/listing | grep "$2" | grep "$3"

# 	fi

# 	cat /tmp/listing
# 	echo -e "$Finfo Key searched \"$Fyellow $1 $Foff\""
# elif [[ -z ! "$3" ]];



# 	if [[ ! "$4" ]]; then
# 		cat /tmp/listing | grep "$2" | grep "$3"
# 			else
# 		echo -e "$Fred KNOCK IT OFF! $Foff"
# 		exit 1
# 	fi

# 	if [[ ! "$3" ]]; then
# 			fi



# fi



# if [[ "$3" != "" ]]; then
# 	grep \"$2\" | grep \"$3\" /tmp/listing
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
echo "-----"
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
=======
source /home/faron/.bash_colors

BULK=( "$@" )
NEWBULK=( $( echo ${BULK[@]} | sed "s/$1//g" ) )
OPEN="sudo apt-cache search"
parma="$1"
for arg in "${NEWBULK[@]}";
			do
				parma="$parma | grep '$arg'"
			done

LOADAPP=( $( $OPEN $parma | sort | sed 's/^/|/g' ))
GETPROCESSED=( $( echo "${LOADAPP[@]}" | sed 's/|/\n|/g' | awk '{ gsub("-", "=", $2); print $0 }' | sed '1d' ) )
echo "${GETPROCESSED[@]}" | tr '|' '\n'

# echo -e "$( echo -e \"${GETPROCESSED[@]}\" | sed 's/|/\n$BGreen /g' | sed 's/=/$Color_Off\ =\ /g' )" >> $HOMEtmp/apt-get.list
# while read line;
# 	do
# 		echo -e $line
# 	done < $HOMEtmp/apt-get.list

#echo -e "${GETPROCESSED[@]}" | sed 's/|/$BGreen/g' | sed 's/=/$Color_Off\ =\ /g' )
# while read -r -d ' - ';
# 	do
# 		apts+=("$elements")
# 	done < < `$( eval $OPEN $parma )`
# #echo ${array[@]} | awk '"\n"{print $1}'
# #IFS=$'\n' read -a element <<< "${array[@]}"
# #appname=( `echo ${array[@]} | awk '{print $1}' `)
# echo ${apts[@]}


#echo "${element[@]}"
# for line in "${element[@]}";
# 	do
# 		echo "$line"
# 	done
# done



# while read $GETAPP
# 	do
# 		printf "$i :: $line"
# 		i=`$i+1`
# 	done
#TOTAL="$( echo ${OUTTO[@]} | wc -l )"
#TOTAL="$( `echo ${GETAPP[@]} | tr '|' '\n' | awk '{print $1}' | wc -l `)"
#echo -e $GETLIST
echo "-----"
BULKED=( `echo "${GETPROCESSED[@]}" | tr '|' '\n' | awk '{print $1}' ` )
SORTED=$( echo "${BULKED[@]}" | wc --words )
echo "Packages found: $SORTED"
echo -n "Proceed to installation?  [y]es or [n]"
read NEXTCOMM
if [[ "$NEXTCOMM" == "y" ]];
	then
		for pull in "${BULKED[@]}";
			do
				sudo apt-get build-dep $pull
				sudo apt-get install -y --force-yes $pull
			done
fi
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
exit 0
