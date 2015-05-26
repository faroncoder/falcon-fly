#/bin/bash
#PATHLOC=$1
# if [ -z "$1" ]
# 	then
# 				PATHLOC="$PWD"
# 	fi
#PREFILE="$( echo "$file" | cut -d "." -f1 )";
#ADUP=$( find $PATHLOC -maxdepth 1 -type d | sort | tail -1 )
#NAD=$( basename $ADUP )
#DUH="$( echo $NAD )"
MEXT="0"
TYPE="$1"
if [ -z "$TYPE" ]
	then
	   echo -n "which type of file extension to numbericize its filename ? "
	   read TYPE
	   EXT=$( echo $TYPE | cut -d '.' -f2 )
	 fi


orderfiles=( $( find $PWD -type f -name "*.$EXT" ) )
for line in "${orderfiles[@]}";
	do
		getname=$( echo $line | cut -d '.' -f1 )
		getnewname=$( seq -w 0 $( echo $MEXT ) | tail -n 1 )
		mv $line "$getnewname.$EXT"
		#rename 's/$( echo $getname )/$( echo $getnewname )/g' $line
		MEXT=`expr $MEXT + 1`

		#find -name "$FILE*" -type f -exec mv {} $FILEASS
		#mv $line $FILEASS.$FILE

	done

stopred=`date`
faronruntime="$(( $stopred - $startgreen ))"
echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log
exit 0

