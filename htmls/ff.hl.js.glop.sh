#!/bin/bash
startgreen=`date +%s`
stopwatchtime(){
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log
  exit 0
}

PATHDIRHOME=$1
if [[ -z "$PATHDIRHOME" ]]; then
		PATHDIRHOME="$PWD"
		#read PATHDIRHOME
	else
		PATHDIRHOME="$1"
		#read PATHDIRHOME
fi
PATHDIRLOC=( `echo "$PATHDIRHOME/jsc"` `echo "$PATHDIRHOME/.jsc"` )
TYPE="js"
for getpath in "${PATHDIRLOC[@]}"; do
	if [[ -d "$getpath" ]]; then
		PATHDIRJSC="$getpath/$TYPE"
	fi
done
if [[ -d "$PATHDIRJSC" ]]; then
	glopperGo() {
		RESULT=$( grep 'loaded' "$PATHDIRJSC/appengine.js" | wc -l )
		echo "FALCON: Gloped $RESULT $TYPE files."
	}
	cd $PATHDIRHOME
	FILEPOINT="$PATHDIRJSC/appengine.$TYPE"
	#if [[ ! -f $FILEPOINT ]]; then
		> $FILEPOINT
		echo "
	\$.getScript(\"./jsc/js/bootstrap.min.js\", function(data, textStatus) {
		console.log(\"bootstrap.min.js loaded\", textStatus);
	});\"" >> $FILEPOINT
	#fi
	echo "App structures match!"
	JSGLOPPER=( `find -L $PATHDIRJSC -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name '*bootstrap*' ! -name '*ie*.js'  -exec basename {} \; ` )
		## CHECKING FOR DEPENDENCIES FOR THE APP AND INSTALL IF NO FIND
	 # 	if [ ! -f "$PATHDIRHOME/jsc/js/bootstrap.min.js" ]; then
		# 		getBootstrap
		# fi
	 # 	## POPULATE FILES INTO ARRAY AND REMOVE SEVERAL NO-NEED-FILES OUT OF THE ARRAY
	#SCLEANGLOP=( $( echo \"${JSGLOPPER[@]}\" | sed '/jsengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' ) )
	 #echo "${JSGLOPPER[@]}"| sed '/jsengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' "
	  	# echo "/* BEGIN CUSTOM SCRIPTING */" >> $FILEPOINT
 	for w in "${JSGLOPPER[@]}"; do
 		#INPUTLOAD="\$.getScript(\"./jsc/js/$w\", function(data, textStatus) \{\n\t\t console.log(\"$w loaded\", textStatus); \n\t\t \});"

		INPUTLOAD=$( echo "
	\$.getScript(\"./jsc/js/$w\", function(data, textStatus) {
		console.log(\"$w loaded\", textStatus);
	});" )

		echo -e "$INPUTLOAD" >> $FILEPOINT
 	done
 	/home/faron/.bin/ff.bin.chom
	glopperGo
	echo "FALCON: appengine.js built"
else
	 echo "FALCON: This is not Faron-based project.  Aborting"
	 stopwatchtime
fi
stopwatchtime
