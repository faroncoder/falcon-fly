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

		if [[ "$1" != "" ]]; then
			TRIMUP="$( rev <<< $1 | cut -d"." -f1 | rev )"
			if [[ ! -d "$PWD/$TRIMUP" ]]; then
				mkdir $TRIMUP -p
			fi
				orderfiles=( `find -type f -name "*.$TRIMUP" ! -path "$PWD/$TRIMUP/*"` )
		else
				orderfiles=( `find . -maxdepth 1 -type f ` )
		fi

MEXT=0
THIS=$( uuid )
mkdir /home/tmp/$THIS -p

SALT=$( uuid | sed 's/-//g' | sed 's/[A-Za-z]//g'  )
MEXT=${SALT:0:8}
N=1

for j in "${orderfiles[@]}";
	do
		# PREFILE=$( rev <<< $j | cut -d"." -f2 | rev )
		N=`echo $(( $N + 1 ))`
		GETEXT=$( rev <<< $j | cut -d"." -f1 | rev )
		MEXT=`echo $(( $MEXT + $SALT )) `
		DEQ=$( seq -w 0000 $( echo $N ) | tail -n 1 )
		THISNAME=`echo "$DEQ${MEXT:0:8}" | sed 's/-//g' `
		TRIMME="${THISNAME:0:9}"
		FINAL="${TRIMME:0:12}.$GETEXT"
		mv $j "/home/tmp/$THIS/$FINAL"

		# FORMAT=$( echo "$(( $MEXT + $SALT )) | sed 's/-//g' " )

	done
	find "/home/tmp/$THIS/" -type f -exec mv {} ./ \;

stopwatchtime
