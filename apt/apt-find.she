#!/bin/bash
startgreen=`date`
BULK=( "$@" )
NEWBULK=( $( echo ${BULK[@]} | sed "s/$1//g" ) )
OPEN="sudo apt-cache search"
parma="$1"
for arg in "${NEWBULK[@]}";
			do
				parma="$parma | grep '$arg'"
			done

GETAPP=( `eval $OPEN $parma | sort | sed 's/^/|/g' ` )
echo ${GETAPP[@]} | tr '|' '\n' | awk '{ gsub("-", "=", $2); print $0 }' | sed '1d'

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
BULKED=`echo ${GETAPP[@]} | tr '|' '\n' | awk '{print $1}' `
SORTED=`echo $BULKED | wc --words`
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
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
