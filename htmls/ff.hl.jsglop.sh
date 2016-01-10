#!/bin/bash
JSGLOP=(  `find -L $PWD -maxdepth 1 -type f -name '*.js' ` )
TYPE="js"
FILEPOINT="$PWD/appengine.$TYPE"
glopperGo() {
		RESULT=$( grep 'loaded' "$FILEPOINT" | wc -l )
		echo "FALCON: Gloped $RESULT $TYPE files."
	}

if [[  ! "$JSGLOP" ]]; then
	echo "No JS files to glop"
else

	> $FILEPOINT
	echo "
	\$.getScript(\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\", function(data, textStatus) {
		console.log(\"bootstrap.min.js loaded\", textStatus);
	});" >> $FILEPOINT
	#fi
	CHECKANGULAR=$( find -L $PWD -maxdepth 1 -type f -name 'angular*.js' -exec basename \; )
	if [ -f "$CHECKANGULAR" ]; then
	echo "
	\$.getScript(\"//.priv/jsc/js/$CHECKANGULAR\", function(data, textStatus) {
		console.log(\"$CHECKANGULAR\", textStatus);
	});" >> $FILEPOINT
	fi
	JSGLOPPER=( `find -L $PATHDIRJSC -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'bootstrap.min.js' ! -name 'angular.min.js' ! -name '*ie*.js'  -exec basename {} \; ` )

		for w in "${JSGLOPPER[@]}"; do
	 		INPUTLOAD=$( echo "
	\$.getScript(\"//.priv/jsc/js/$w\", function(data, textStatus) {
		console.log(\"$w loaded\", textStatus);
	});" )
			echo -e "$INPUTLOAD" >> $FILEPOINT
		done
fi
exit 0