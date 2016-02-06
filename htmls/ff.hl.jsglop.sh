#!/bin/bash
PROJ=$1
if [ -z "$PROJ" ]; then
	PROJ=$PWD
fi
# else
# 	PROJ=$( find -L $PROJ -type d -name "*jsc" -exec dirname {} \; )
# fi
if [ -d "$PROJ/jsc" ]; then
		JSCLOC="jsc"
		if [ -d "$PROJ/.jsc" ];	then
			JSCLOC=".jsc"
		fi
	else
		echo "No JSC. Exiting."
		exit 1
fi
# PROJsc=$( find -L $PROJ -type d -name "*jsc" -exec basename {} \; )
TYPE="js"
FILEPOINT="appengine.$TYPE"
DOME="$PROJ/$JSCLOC/$TYPE"
if [ -d "$DOME" ]; then
		echo "Entering js folder."
		cd $DOME
else
		if [ ! -d "$DOME" ]; then
			echo "No JSC.  Exiting."
			exit 2
		fi
fi

JSGLOP=$( find -L . -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' )

glopperGo() {
		RESULT=$( echo ${JSGLOP[@]} | wc -w )
		echo "$RESULT $TYPE files glopped"
}

JSGLOPPER=( ` find -L . -maxdepth 1 -type f -name '*.js' ! -name 'appengine*' -exec basename {} \; ` )
if [[ -z "$JSGLOPPER" ]]; then
	echo "No $TYPE files to glop"
else
	> $FILEPOINT
	echo "
	\$.getScript(\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\", function(data, textStatus) {
		console.log(\"bootstrap.min.js loaded\", textStatus);
	});" >> $FILEPOINT
	# CHECKANGULAR=$( find -L . -maxdepth 1 -type f -name 'angular*.js' -exec basename \; )
	# if [ -f "$CHECKANGULAR" ]; then
	# echo "
	# \$.getScript(\"//jsc/js/$CHECKANGULAR\", function(data, textStatus) {
	# 	console.log(\"$CHECKANGULAR\" loaded, textStatus);
	# });" >> $FILEPOINT
	# fi
	JSGLOPPER=( $( find -L . -maxdepth 1 -type f -name '*.js' ! -name 'appengine*' ! -name 'bootstrap*.js' ! -name 'angular*.js' ! -name '*ie*.js' ) )
		for w in "${JSGLOPPER[@]}"; do
	 		FILEGET=$( basename $w )
	 		INPUTLOAD=$( echo "
	\$.getScript(\"//jsc/js/$FILEGET\", function(data, textStatus) {
		console.log(\"$FILEGET loaded\", textStatus);
	});" )
			echo -e "$INPUTLOAD" >> $FILEPOINT
		done
	glopperGo
fi
cd $PROJ

exit 0

