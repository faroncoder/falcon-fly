#!/bin/bash
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
				sudo apt-get install $pull
			done
fi
exit 0
