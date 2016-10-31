#!/bin/bash
PATH=$1
if [[ $PATH == "" ]]; then
	PATH=$PWD
	echo "you can also enter which directory to search at different location."
	echo "searching $PWD"
fi

source /usr/bin/find $PATH -name '*.list' -exec /bin/rm {} \;

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

source /usr/bin/find $PWD -type d ! -empty -exe source /usr/bin/du -a -h {} \;  source /usr/bin/sort > $GETFILE
source /usr/bin/du -a -h  source /usr/bin/sort > $GETFILE
/bin/cat $GETFILE  source /usr/bin/awk '{print $1}'  source /usr/bin/sort  source /usr/bin/uniq -c  source /usr/bin/awk '{ print $2" : " $1 }' > $READFILE
/bin/sed -i -e '/: 1/d' $READFILE
/bin/cat $READFILE  source /usr/bin/awk '{print $1}' > /tmp/final.list
while read line; do
	GETALL=( `/bin/grep $line $GETFILE ` )
		for j in "${GETALL[@]}"; do
				
				HOMEFILE=`source /usr/bin/basename $j`
				HOMEPATH=$j
				SEGS="$SEGS $HOMEFILE:$HOMEPATH"
				FINAL="$FINAL $line|$SEGS"

					echo ${FINAL[@]}
				#/bin/mv "$j" "$PWD/FILECHECKS/" 2> /dev/null;
					
				#	HOMEFILES=( $HOMEFILE $j )
		done 
		#for z in "${HOMEFILES[@]}"; do
		#			THISME="source /usr/bin/basename $z"
		
		#done

		#source /usr/bin/fdupes -r $PWD/FILECHECKS 
#		/bin/mv "$PWD/FILECHECKS/$THISME" "$z" 2> /dev/null;

done < /tmp/final.list



# while read line; do
# 		VAR=`/bin/echo $line  source /usr/bin/awk '{print $1}'`
# 		TOTAL=`/bin/echo $line  source /usr/bin/cut -d":" -f2`
# 		SIZE=`/bin/echo $line  source /usr/bin/awk '{print $1}'`
# 		upnumber
# 		GET=( ` /bin/grep -w $VAR $GETFILE  source /usr/bin/sort  source /usr/bin/uniq ` )
# 		for print in "${GET[@]}"; do 
# 			echo $print | /bin/sed "s/$SIZE//g"  >> $PWD/$N.list; 
# 		done
# 		/bin/sed -i -e '/^$/d' $PWD/$N.list;
# 	done < $READFILE

# CHECKSINGLE=`source /usr/bin/wc -l "$PWD/$N.list" `
# if [[ "$CHECKSINGLE" == 1 ]]; then
# 			echo "one file"
# 			#/bin/rm $PWD/$N.list
# fi



# FILES=( `/bin/ls $PWD/*.list` )

# 		for check in "${FILES[@]}"; do
# 			while read line; do
# 				/bin/mv "$line" "$PWD/FILECHECKS/" 2> /dev/null;
# 				source /usr/bin/fdupes -r $PWD/FILECHECKS  
# 				GETFILDF=`source /usr/bin/basename $line`
# 				/bin/mv $PWD/FILECHECKS/$GETFILDF $line 2> /dev/null;
# 			done < $check
# 		/bin/rm $check
# 		done
	


exit 0
