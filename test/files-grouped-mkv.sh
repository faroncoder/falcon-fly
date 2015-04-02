#/bin/bash
PATHLOC=$1
# if [ -z "$1" ]
# 	then
# 				PATHLOC="$PWD"
# 	fi
#PREFILE="$( echo "$file" | cut -d "." -f1 )";
#ADUP=$( find $PATHLOC -maxdepth 1 -type d | sort | tail -1 )
#NAD=$( basename $ADUP )
#DUH="$( echo $NAD )"
MEXT=`expr 0 + 1`

orderfiles=( $( find $PWD -type f -name '*.mkv' ) )
for line in "${orderfiles[@]}";
	do
		getname=$( echo $line | cut -d '.' -f1 )
		getnewname=$( seq -w 0 $( echo $MEXT ) | tail -n 1 )
		mv $line $getnewname.mp4
		#rename 's/$( echo $getname )/$( echo $getnewname )/g' $line
		MEXT=`expr $MEXT + 1`

		#find -name "$FILE*" -type f -exec mv {} $FILEASS
		#mv $line $FILEASS.$FILE

	done

exit 0

