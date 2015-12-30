#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN



#orderfiles=( $( find $PWD -type f -name "*.$EXT" ) )
#orderfiles=( "$CMDGET" )

		if [ "$1" != '' ]; then
			TRIMUP=`rev <<< $1 | cut -d"." -f1 | rev`
			if [ ! -d "$PWD/$TRIMUP" ]; then
				mkdir $TRIMUP -p
			fi
				orderfiles=( `find -type f -name "*.$TRIMUP" ! -path "$PWD/$TRIMUP/*"` )
		else
				orderfiles=( `find -type f ! -path "$PWD/seralized/*" ` )
		fi

MEXT="0"

for j in "${orderfiles[@]}";
	do
		PREFILE=`rev <<< $j | cut -d"." -f2 | rev `
		GETEXT=`rev <<< $j | cut -d"." -f1 | rev`
		GETNEWNAME=`seq -w 0 $( echo $MEXT ) | tail -n 1 `

		rename "s/$PREFILE/$( seq -w 00001 $( echo $MEXT  ) | tail -n 1 )/g" $j
		#cp $line seralized/"$GETNEWNAME.$GETEXT"
		#msssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssv $j "$PWD/$TRIMUP/$GETNEWNAME.$GETEXT"
		#rm $line
		#rename 's/$( echo $GETNAME )/$( echo $GETNEWNAME )/g' $line
		#MEXT=`expr $MEXT + 1`
		MEXT=$( echo $(( $MEXT + 1 )) )
		#rm $line
		#find -name "$FILE*" -type f -exec mv {} $FILEASS
		#mv $line $FILEASS.$FILE
	done

stopwatchtime
