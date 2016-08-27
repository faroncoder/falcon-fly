#!/bin/bash
PATH=$1
if [[ $PATH == "" ]]; then
	PATH=$PWD
	echo "you can also enter which directory to search at different location."
	echo "searching $PWD"
fi

/usr/bin/find $PATH -name '*.list' -exec /bin/rm {} \;

GETFILE=/tmp/collection.list
READFILE=/tmp/sizes.list

/bin/mkdir -p $PWD/FILECHECKS 2> /dev/null;


> $GETFILE
> $READFILE
> /tmp/final.list



N=0; 
upnumber(){
	N=`echo $(( $N + 1 ))` 
}

/usr/bin/find $PWD -type d ! -empty -exec /usr/bin/du -a -h {} \; | /usr/bin/sort > $GETFILE
/usr/bin/du -a -h | /usr/bin/sort > $GETFILE
/bin/cat $GETFILE | /usr/bin/awk '{print $1}' | /usr/bin/sort | /usr/bin/uniq -c | /usr/bin/awk '{ print $2" : " $1 }' > $READFILE
/bin/sed -i -e '/: 1/d' $READFILE
/bin/cat $READFILE | /usr/bin/awk '{print $1}' > /tmp/final.list
while read line; do
	GETALL=( `/bin/grep $line $GETFILE ` )
		for j in "${GETALL[@]}"; do
				
				HOMEFILE=`/usr/bin/basename $j`
				HOMEPATH=$j
				SEGS="$SEGS $HOMEFILE:$HOMEPATH"
				FINAL="$FINAL $line|$SEGS"

					echo ${FINAL[@]}
				#/bin/mv "$j" "$PWD/FILECHECKS/" 2> /dev/null;
					
				#	HOMEFILES=( $HOMEFILE $j )
		done 
		#for z in "${HOMEFILES[@]}"; do
		#			THISME="/usr/bin/basename $z"
		
		#done

		#/usr/bin/fdupes -r $PWD/FILECHECKS 
#		/bin/mv "$PWD/FILECHECKS/$THISME" "$z" 2> /dev/null;

done < /tmp/final.list



# while read line; do
# 		VAR=`/bin/echo $line | /usr/bin/awk '{print $1}'`
# 		TOTAL=`/bin/echo $line | /usr/bin/cut -d":" -f2`
# 		SIZE=`/bin/echo $line | /usr/bin/awk '{print $1}'`
# 		upnumber
# 		GET=( ` /bin/grep -w $VAR $GETFILE | /usr/bin/sort | /usr/bin/uniq ` )
# 		for print in "${GET[@]}"; do 
# 			echo $print | /bin/sed "s/$SIZE//g"  >> $PWD/$N.list; 
# 		done
# 		/bin/sed -i -e '/^$/d' $PWD/$N.list;
# 	done < $READFILE

# CHECKSINGLE=`/usr/bin/wc -l "$PWD/$N.list" `
# if [[ "$CHECKSINGLE" == 1 ]]; then
# 			echo "one file"
# 			#/bin/rm $PWD/$N.list
# fi



# FILES=( `/bin/ls $PWD/*.list` )

# 		for check in "${FILES[@]}"; do
# 			while read line; do
# 				/bin/mv "$line" "$PWD/FILECHECKS/" 2> /dev/null;
# 				/usr/bin/fdupes -r $PWD/FILECHECKS  
# 				GETFILDF=`/usr/bin/basename $line`
# 				/bin/mv $PWD/FILECHECKS/$GETFILDF $line 2> /dev/null;
# 			done < $check
# 		/bin/rm $check
# 		done
	


exit 0
