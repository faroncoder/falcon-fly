#!/bin/bash
startgreen=`date +%s`
stopwatchtime(){
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log
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
#PATHDIRLOC=( `echo "$PATHDIRHOME/jsc"` `echo "$PATHDIRHOME/.jsc"` )
TYPE="js"
#for getpath in "${PATHDIRLOC[@]}"; do
#	if [[ -d "$getpath" ]]; then
#		PATHDIRJSC="$getpath/$TYPE"
#	fi
#done
#if [[ -d "$PATHDIRJSC" ]]; then
	glopperGo() {
		RESULT=$( grep 'loaded' "$PWD/appengine.js" | wc -l )
		echo "FALCON: Gloped $RESULT $TYPE files."
	}
#	cd $PATHDIRHOME
	FILEPOINT="$PWD/appengine.$TYPE"
#	FILEPOINT="$PATHDIRJSC/appengine.$TYPE"
	#if [[ ! -f $FILEPOINT ]]; then
		> $FILEPOINT
		echo "
	\$.getScript(\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\", function(data, textStatus) {
		console.log(\"bootstrap.min.js loaded\", textStatus);
	});" >> $FILEPOINT
	#fi
	CHECKANGULAR=$( find -L ./jsc/js -maxdepth 1 -type f -name 'angular*.js' )
	if [ -f "$CHECKANGULAR" ]; then
		CLEANFILELOC=$( basename $CHECKANGULAR )
		echo "
	\$.getScript(\"$CHECKANGULAR\", function(data, textStatus) {
		console.log(\"$CLEANFILELOC\", textStatus);
	});" >> $FILEPOINT
	fi
	# 	echo "
	# \$.getScript(\"http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.0.5/angular.min.js\", function(data, textStatus) {
	# 	console.log(\"angular.min.js fetched\", textStatus);
	# });" >> $FILEPOINT



#	echo "App structures match!"
	JSGLOPPER=( $( find -L $PATHDIRJSC -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'bootstrap.min.js' ! -name 'angular.min.js' ! -name '*ie*.js'  -exec basename {} \; ) )
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
# 	/usr/local/bin/ff.bin.chom
	glopperGo
	echo "FALCON: appengine.js built"
#else
#	 echo "FALCON: This is not Faron-based project.  Aborting"
#	 stopwatchtime
#fi
stopwatchtime
