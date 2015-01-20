#/bin/bash
PATHLOC="$1"
if [ -z "$1" ]
	then
		echo -n "which directory that has the latest filename order? "
		read PATHLOC
		if [ -z "$PATHLOC" ]
			then
				PATHLOC=""
		fi

fi

ADUP=$( find $PATHLOC -maxdepth 1 -type d | sort | tail -1 )
NAD=$( basename $ADUP )
DUH="$( echo $NAD )"
MEXT=`expr $DUH + 1`
> a.list
ls *.mp4 >> a.list

# while read line
# 	do
# 		FILEASS=$( seq -w 000000 $MEXT | tail -1 )
# 		echo $FILEASS $line >> mkdir.list
# 		MEXT=`expr $MEXT + 1`
# 	done < a.list
# rm a.list

while read line
	do
		FILEASS=$( seq -w 000000 $MEXT | tail -1 )
		FILE="$( rev <<< "$line" | cut -d"." -f2 | rev )"
		#MKDIR=$( echo $line | awk '{ print $1 }' )
		#FILETR=$( echo $line | awk '{ print $2 }' )
		mkdir -p $FILEASS
		mv $FILE* $FILEASS
		MEXT=`expr $MEXT + 1`


	done < a.list

exit 0

