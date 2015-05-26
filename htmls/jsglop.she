#!/bin/bash
startgreen=`date`

if [[ -z "$1" ]]; then
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$1"
fi

function getBootstrap() {
	cp /home/faron/.falcon/scripting/falcon-fly/htmls/VALVE/bootstrap.min.js.txt $PATHDIRHOME/jsc/js/bootstrap.min.js
}

function templateJSAppEngine() {
	echo "/* BEGIN CUSTOM SCRIPTING */

	" > $PATHDIRHOME/jsc/js/appengine.js
	echo "/* END CUSTOM SCRIPTING */" >> $PATHDIRHOME/jsc/js/appengine.js
}

function glopperGo() {
	RESULT=$( cat "$PATHDIRHOME/jsc/js/appengine.js" | wc -l )
	echo "Gloped $RESULT js files."
}


if [[ -z "$PATHDIRHOME/jsc" ]]; then
		echo -n "You need to be inside working directory of the project (the  that holds 'JSC' folder (level 1).
			Aborting."
			stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
	else
		if [[ -d "$PATHDIRHOME/jsc/js" ]]; then
			echo "App structures match!"
			GETALLJS=( "$( find -L "$PATHDIRHOME/jsc/js" -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'bootstrap*' -exec basename {} \; )" )
			if [[ ! -f "$PATHDIRHOME/jsc/js/bootstrap.min.js" ]]; then
				getBootstrap
			fi
			echo "\$.getScript(\"./jsc/js/bootstrap.min.js\", function(data, textStatus) { console.log( \"bootstrap loaded\", textStatus); });" > $PATHDIRHOME/jsc/js/appengine.js;
			for f in "${GETALLJS[@]}"; do
				echo "\$.getScript(\"./jsc/js/$f\", function(data, textStatus) { console.log(\"$f loaded\", textStatus); });" >> $PATHDIRHOME/jsc/js/appengine.js;
			done
			#find -L $PATHDIRHOME/jsc/js -maxdepth 1 -type f -name '*.js' >> "$PATHDIRHOME/jsglop.dat"
			#sed -i -e '/appengine/d' "$PATHDIRHOME/jsglop.dat"
			#sed -i -e '/bootstrap.min.js/d' "$PATHDIRHOME/jsglop.dat"

			#while read line; do
				  # THISFILE=$( basename $line )
			#	  echo "\$.getScript(\"$THISFILE\", function(data, textStatus) { console.log(\"$THISFILE loaded\", textStatus);
			#		});" >> $PATHDIRHOME/jsc/js/appengine.js
			#done < "$PATHDIRHOME/jsglop.dat"
			#rm "$PATHDIRHOME/jsglop.dat"
			glopperGo
			echo "appengine.js built"

   		else
   			echo "This is not Faron-based project.  Aborting"
   		fi
fi

# if [[ -d "$PATHDIRHOME/jsc/js" ]]; then

#         for f in "${GETALLJS[@]}";
#         	do
#        		templateJSAppEngine()
#  			/home/faron/bin/appengine-generator
#  			COMPILEVAR="$( cat script.dat | sed \"s/BASHFILENAME/$f/g\" )"
# 			sed -i -e "/BEGIN/a $COMPILEVAR" $PATHDIRHOME/jsc/js/appengine.js

#  			jsc/js/appengine.js

#  SETJSLINE="$.getScript("./jsc/jsc/$f", function(data, textStatus) {
#         console.log("$f loaded", textStatus);
#     });"
#  #                       sed -i "/BEGIN/a $SETJSLINE" appengine.js
# #
#         	done
#         else
#         	echo "We are not in a project folder.  Aborted"
#         	exit 1
# fi

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

