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



# getBootstrap() {
# 	if [[ ! -d "$PATHDIRHOME/jsc/css/custom" ]]; then
# 				cd $PATHDIRHOME
# 				mkdir -p $PATHDIRHOME/jsc/css/custom
# 				cp /home/fly/scripts/data/VAULT/bootstrap.min.css.txt $PATHDIRHOME/jsc/css/custom/bootstrap.min.css
# 				cp /home/fly/scripts/data/VAULT/bootstrap-responsive.min.css.txt $PATHDIRHOME/jsc/css/custom/bootstrap-responsive.min.css
# 				cd $PATHDIRHOME/jsc/css
# 				ln -s custom/bootstrap.min.css
# 				ln -s custom/bootstrap-responsive.min.css
# 		fi
# }

PATHDIRHOME=$1
if [[ -z "$PATHDIRHOME" ]]; then
		PATHDIRHOME="$PWD"
		#read PATHDIRHOME
	else
		PATHDIRHOME="$1"
		#read PATHDIRHOME
fi
PATHDIRLOC=( `echo "$PATHDIRHOME/jsc"` `echo "$PATHDIRHOME/.jsc"` )
for getpath in "${PATHDIRLOC[@]}"; do
	if [[ -d "$getpath" ]]; then
		PATHDIRJSC="$getpath"
	fi
done
glopperGo() {
	if [ -d "$PATHDIRJSC/css" ]; then
		RESULT=$( grep '.css' "$PATHDIRJSC/css/cssengine.css" | wc -l )
		echo "FALCON: Gloped $RESULT css files."
	fi
}


if [ -d "$PATHDIRJSC/css" ]; then
	echo "App structures match!"
 	CSSGLOPPER=( `  find -L "$PATHDIRJSC/css" -maxdepth 1 ! -name 'cssengine*' ! -name '*ie*css'  -name '*.css' -exec basename {} \; ` )
		if [ ! -f "$PATHDIRJSC/css/bootstrap.min.css" ] || [ ! -f "$PATHDIRJSC/css/bootstrap-responsive.min.css" ]; then
		getBootstrap
		fi
 	#if [ ! -f "$PATHDIRJSC/css/bootstrap-responsive.min.css" ]; then
	#		getBootstrap
	#fi
	#CLEANGLOP=( $( echo "${CSSGLOPPER[@]}" | sed '/cssengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' ) )
		echo "@charset \"UTF-8\";" > "$PATHDIRJSC/css/cssengine.css"
	for b in "${CSSGLOPPER[@]}"; do
	 	INJECTION="@import url (`printf  \"'$b'\"`);"
	 	echo $INJECTION >> "$PATHDIRJSC/css/cssengine.css"
		done
		echo "FALCON: cssengine.css built"
		glopperGo
else
		echo "FALCON: This is not Faron-based project.  Aborting"
		stopwatchtime
fi
stopwatchtime

