#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN

if [[ -z "$1" ]]; then
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$1"
fi

function getBootstrap() {
	if [[ ! -d "$PATHDIRHOME/jsc/css/custom" ]]; then
				cd $PATHDIRHOME
				mkdir -p $PATHDIRHOME/jsc/css/custom
				cp /home/faron/.falcon/scripts/falcon-fly/data/VAULT/bootstrap.min.css.txt $PATHDIRHOME/jsc/css/custom/bootstrap.min.css
				cp /home/faron/.falcon/scripts/falcon-fly/data/VAULT/bootstrap-responsive.min.css.txt $PATHDIRHOME/jsc/css/custom/bootstrap-responsive.min.css
				cd $PATHDIRHOME/jsc/css
				ln -s custom/bootstrap.min.css
				ln -s custom/bootstrap-responsive.min.css
		fi
	}

function glopperGo() {
	RESULT=$( grep '.css' "$PATHDIRHOME/jsc/css/cssengine.css" | wc -l )
	echo "FALCON: Gloped $RESULT css files."
}
if [[ -d "$PATHDIRHOME/jsc/css" ]]; then
		echo "App structures match!"
	 	CSSGLOPPER=( "$( find -L $PATHDIRHOME/jsc/css -maxdepth 1 -type f -name '*.css' -exec basename {} \; )" )
	 	if [[ ! -f "$PATHDIRHOME/jsc/css/bootstrap.min.css" ]]; then
				getBootstrap
		fi
	 	if [[ ! -f "$PATHDIRHOME/jsc/css/bootstrap-responsive.min.css" ]]; then
				getBootstrap
		fi
		CLEANGLOP=( $( echo "${CSSGLOPPER[@]}" | sed '/cssengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' ) )
	 	echo "@charset \"UTF-8\";" > $PATHDIRHOME/jsc/css/cssengine.css
		for b in "${CLEANGLOP[@]}";
			do
			 	INJECTION="@import url ( '`echo $b`' );"
			 	echo "$INJECTION" >> $PATHDIRHOME/jsc/css/cssengine.css;
	 		done
 		glopperGo
		echo "FALCON: cssengine.css built"
else
	  	echo "FALCON: This is not Faron-based project.  Aborting"
	  	stopwatchtime
fi
stopwatchtime

