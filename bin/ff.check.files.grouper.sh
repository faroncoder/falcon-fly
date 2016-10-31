#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
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
THS=$( uuid )
THIS="/tmp/$THS" 

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
		mv $j "$THIS/$FINAL"

		# FORMAT=$( echo "$(( $MEXT + $SALT )) | sed 's/-//g' " )

	done
	find "/home/tmp/$THIS/" -type f -exec mv {} ./ \;

stopwatchtime
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.check.files.grouper.sh  [ACTIVE] y

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.check.files.grouper.sh  [ACTIVE] y

