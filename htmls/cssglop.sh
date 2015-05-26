#!/bin/bash
startgreen=`date`

if [[ -z "$1" ]]; then
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$1"
fi

function getBootstrap() {
	cp /home/faron/.falcon/scripting/falcon-fly/htmls/VALVE/bootstrap.min.css.txt $PATHDIRHOME/jsc/css/bootstrap.min.css
	cp /home/faron/.falcon/scripting/falcon-fly/htmls/VALVE/bootstrap-responsive.min.css.txt $PATHDIRHOME/jsc/css/bootstrap-responsive.min.css
}

function glopperGo() {
	RESULT=$( grep '.css' "$PATHDIRHOME/jsc/css/cssengine.css" | wc -l )
	echo "Gloped $RESULT css files."
}
> $PATHDIRHOME/files.list
if [[ -d "$PATHDIRHOME/jsc/css" ]]; then
		echo "App structures match!"
	 	find -L $PATHDIRHOME/jsc/css -maxdepth 1 -type f -name '*.css' -exec basename {} \; >> $PATHDIRHOME/files.list
	 	if [[ ! -f "$PATHDIRHOME/jsc/css/bootstrap.min.css" ]]; then
				getBootstrap
		fi
	 	if [[ ! -f "$PATHDIRHOME/jsc/css/bootstrap-responsive.min.css" ]]; then
				getBootstrap
		fi
	 	echo "@charset \"UTF-8\";" > $PATHDIRHOME/jsc/css/cssengine.css
	 	sed -i -e '/cssengine/d' $PATHDIRHOME/files.list
	 	sed -i -e '/ie6/d' $PATHDIRHOME/files.list
	 	while read line
	 		do
				echo "@import url( $line );" >> $PATHDIRHOME/jsc/css/cssengine.css;
        	done < $PATHDIRHOME/files.list
        	rm $PATHDIRHOME/files.list
		glopperGo
		echo "cssengine.css built"
        else
        	echo "This is not Faron-based project.  Aborting"
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
fi

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

