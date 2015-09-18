#!/bin/bash
startgreen=`date +%s`
stopwatchtime(){
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}
######## IGNORE ABOVE -- LOGGING PURPOSE ########
######## use 'stopwatchtime' instead of 'exit 0' ########

if [[ -z "$1" ]]; then
		#PATHDIRHOME="/home/faron/.falcon/scripts/falcon-fly/htmls/VAULT/lab/mediaelement"
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$1"
fi
cd $PATHDIRHOME
# function getBootstrap() {
# 	if [ ! -d "$PATHDIRHOME/jsc/js/custom" ]; then
# 				tar -jxvf /home/faron/.falcon/scripts/falcon-fly/htmls/VAULT/jsc-build.tar.gz
# #				mkdir -p $PATHDIRHOME/jsc/{js,css}
# #				mkdir -p jsc/js/custom
# #				mkdir -p jsc/css/custom
# 				cp "/home/faron/.falcon/scripts/falcon-fly/htmls/VAULT/bootstrap.min.js.txt" "$PATHDIRHOME/jsc/js/custom/bootstrap.min.js"
# 				cd $PATHDIRHOME/jsc/js
# 				ln -s custom/bootstrap.min.js
# 	fi
# 	}

FILEPOINT="$PATHDIRHOME/jsc/js/appengine.js"
function glopperGo() {
	RESULT=$( grep '.js' "$FILEPOINT" | wc -l )
	echo "FALCON: Gloped $RESULT js files."
}

if [ ! -f "$FILEPOINT" ]; then
	sudo sh -c "echo \"
    \$.getScript(\"./jsc/js/bootstrap.min.js\", function(data, textStatus) {
        console.log(\"bootstrap.min.js loaded\", textStatus);
    });
  /*### SED-CUSTOM-ADD ###*/\"" > $FILEPOINT
fi

if [ -d "$PATHDIRHOME/jsc/js" ]; then
		echo "App structures match!"
		JSGLOPPER=( $( find -L $PATHDIRHOME/jsc/js -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name '*bootstrap*' ! -name '*ie8*' ! -name '*ie9*' ! -name '*ie7*' ! -name '*ie6*' ! -name '*.swf*' ! -name '*silver*xap'  -exec basename {} \; ) )
		## CHECKING FOR DEPENDENCIES FOR THE APP AND INSTALL IF NO FIND
	 # 	if [ ! -f "$PATHDIRHOME/jsc/js/bootstrap.min.js" ]; then
		# 		getBootstrap
		# fi
	 # 	## POPULATE FILES INTO ARRAY AND REMOVE SEVERAL NO-NEED-FILES OUT OF THE ARRAY
	#SCLEANGLOP=( $( echo \"${JSGLOPPER[@]}\" | sed '/jsengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' ) )
	 #echo "${JSGLOPPER[@]}"| sed '/jsengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' "
	  	# echo "/* BEGIN CUSTOM SCRIPTING */" >> $FILEPOINT



	 	for w in "${JSGLOPPER[@]}";
	 		do
	 		#	sed -i -e 's/"//g' $w
	 		# 	FILEEXT=`echo $( rev <<< $w | cut -d"." -f1 | rev )`
				# FILEMIN=`echo $( rev <<< $w | cut -d"." -f2 | rev )`
				# FILEID=`echo $w | cut -d"." -f1 `
				# FILENAME="$FILEID.$FILEMIN.$FILEEXT"
				# if [[ "$FILEMIN" !== "min" ]]; then
				# 	FILEMIN="NIL"
				# 	FILENAME=`echo $FILENAME | sed 's/.NIL//g'`
				# fi


				#else
				#	FILEGRAB="$( rev <<< $w | cut -d '.' -f2 | rev )"
				#	FILEID="$FILEGRAB.$FILEEXT"
				#fi

				#echo "\$.getScript(\"./jsc/js/$FILEID\", function(data, textStatus) { console.log(\"$w loaded\", textStatus); });" >>  $FILENAME

				sudo sed -i -e "/$w/d" $PWD/jsc/js/appengine.js

				sudo sed -i "/SED-CUSTOM/a\$.getScript(\"./jsc/js/$w\", function(data, textStatus) { console.log(\"$w loaded\", textStatus); });" $PWD/jsc/js/appengine.js

				 # SETJSLINE="$( echo \"\$.getScript(\"./jsc/js/$FILEID\", function(data, textStatus) {
     #     console.log(\"$FILEGRAB loaded\", textStatus);
     # }); \" )"

				# echo $SETJSLINE
done

	#		 	INJECTION="\$.getScript(\"./jsc/js/$FILEID\", function(data, textStatus) {
	#		 	                        console.log( \"$FILEGRAB loaded\", textStatus); });" >> $FILEPOINT;
		# 	 	echo $SETJSLINE >> $FILEPOINT;
	 # 		done
 	#	echo "/* END CUSTOM SCRIPTING */" >> $FILEPOINT
 		/home/faron/.bin/ff.bin.chom
 		glopperGo
		echo "FALCON: appengine.js built"
else
	  	echo "FALCON: This is not Faron-based project.  Aborting"
	  	stopwatchtime
fi
stopwatchtime



# if [[ -z "$PATHDIRHOME/jsc" ]]; then
# 		echo -n "You need to be inside working directory of the project (the  that holds 'JSC' folder (level 1).
# 			Aborting."
# 			stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
# 	else
# 		if [[ -d "$PATHDIRHOME/jsc/js" ]]; then
# 			echo "App structures match!"
# 			GETALLJS=( "$( find -L "$PATHDIRHOME/jsc/js" -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'bootstrap*' -exec basename {} \; )" )
# 			if [[ ! -f "$PATHDIRHOME/jsc/js/bootstrap.min.js" ]]; then
# 				getBootstrap
# 			fi
# 			echo "\$.getScript(\"./jsc/js/bootstrap.min.js\", function(data, textStatus) { console.log( \"bootstrap loaded\", textStatus); });" > $PATHDIRHOME/jsc/js/appengine.js;
# 			for f in "${GETALLJS[@]}"; do
# 				echo "\$.getScript(\"./jsc/js/$f\", function(data, textStatus) { console.log(\"$f loaded\", textStatus); });" >> $PATHDIRHOME/jsc/js/appengine.js;
# 			done
# 			#find -L $PATHDIRHOME/jsc/js -maxdepth 1 -type f -name '*.js' >> "$PATHDIRHOME/jsglop.dat"
# 			#sed -i -e '/appengine/d' "$PATHDIRHOME/jsglop.dat"
# 			#sed -i -e '/bootstrap.min.js/d' "$PATHDIRHOME/jsglop.dat"

# 			#while read line; do
# 				  # THISFILE=$( basename $line )
# 			#	  echo "\$.getScript(\"$THISFILE\", function(data, textStatus) { console.log(\"$THISFILE loaded\", textStatus);
# 			#		});" >> $PATHDIRHOME/jsc/js/appengine.js
# 			#done < "$PATHDIRHOME/jsglop.dat"
# 			#rm "$PATHDIRHOME/jsglop.dat"
# 			glopperGo
# 			echo "appengine.js built"

#    		else
#    			echo "This is not Faron-based project.  Aborting"
#    		fi
# fi

# # if [[ -d "$PATHDIRHOME/jsc/js" ]]; then

# #         for f in "${GETALLJS[@]}";
# #         	do
# #        		templateJSAppEngine()
# #  			/home/faron/.bin/appengine-generator
# #  			COMPILEVAR="$( cat script.dat | sed \"s/BASHFILENAME/$f/g\" )"
# # 			sed -i -e "/BEGIN/a $COMPILEVAR" $PATHDIRHOME/jsc/js/appengine.js

# #  			jsc/js/appengine.js

# #  SETJSLINE="$.getScript("./jsc/jsc/$f", function(data, textStatus) {
# #         console.log("$f loaded", textStatus);
# #     });"
# #  #                       sed -i "/BEGIN/a $SETJSLINE" appengine.js
# # #
# #         	done
# #         else
# #         	echo "We are not in a project folder.  Aborted"
# #         	exit 1
# # fi


