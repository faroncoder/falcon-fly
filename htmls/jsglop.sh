#!/bin/bash
startgreen=`date +%s`

if [[ -z "$1" ]]; then
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$1"
fi

function templateJSAppEngine() {
	/home/faron/bin/appengine-generator
	echo "\$(function(data, textStatus) {
    /* BEGIN CUSTOM SCRIPTING */ " > $PATHDIRHOME/jsc/js/appengine.js

}

function glopperGo() {
	RESULT=$( cat jsglop.dat | wc -l )
	echo "Gloped $RESULT js files."
}


if [[ -z "$PATHDIRHOME/jsc" ]]; then
		echo -n "You need to be inside working directory of the project (the  that holds 'JSC' folder (level 1).
			Which pathdir ? "
			read PATHDIRHOME
			$0 $PATHDIRHOME
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
	else
		if [[ -d "$PATHDIRHOME/jsc/js" ]]; then
			echo "App structures match!"
			#GETALLJS=( "$( find -L "$PATHDIRHOME/jsc/js" -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'jsengine.js' ! -name 'bootstrap*' )" )
			templateJSAppEngine
			find -L jsc/js -maxdepth 1 -type f -name '*.js' > jsglop.dat
			glopperGo
			sed -i -e '/appengine/d' jsglop.dat
			sed -i -e '/jsengine/d' jsglop.dat
			sed -i -e '/bootstrap.min.js/d' jsglop.dat
			glopperGo
			while read line; do
				  echo "\$.getScript(\"./jsc/js/$line\", function(data, textStatus) { console.log(\"$line loaded\", textStatus);" >> jsc/js/appengine.js
			done < jsglop.dat
			rm jsglop.dat
			echo "/* END CUSTOM SCRIPTING */ }); /* end function */" >> $PATHDIRHOME/jsc/js/appengine.js
			echo "appengine.js is built!"

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

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

