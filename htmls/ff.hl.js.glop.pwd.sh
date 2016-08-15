startgreen=`date +%s`
stopwatchtime(){
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
<<<<<<< HEAD
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
=======
<<<<<<< HEAD
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log
=======
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
  exit 0
}

PATHDIRHOME=$PWD
TYPE="js"
	glopperGo() {
		RESULT=$( grep 'loaded' "$PWD/appengine.js" | wc -l )
		echo "FALCON: Gloped $RESULT $TYPE files."
	}
	FILEPOINT="$PWD/appengine.$TYPE"
		> $FILEPOINT
		echo "
	\$.getScript(\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\", function(data, textStatus) {
		console.log(\"bootstrap.min.js loaded\", textStatus);
	});" >> $FILEPOINT
	CHECKANGULAR=$( find -L . -maxdepth 1 -type f -name 'angular*.js' )
	if [ -f "$CHECKANGULAR" ]; then
		CLEANFILELOC=$( basename $CHECKANGULAR )
		echo "
	\$.getScript(\"$CHECKANGULAR\", function(data, textStatus) {
		console.log(\"$CLEANFILELOC\", textStatus);
	});" >> $FILEPOINT
	fi



	JSGLOPPER=( $( find -L $PWD -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'bootstrap.min.js' ! -name 'angular.min.js' ! -name '*ie*.js'  -exec basename {} \; ) )
 	for w in "${JSGLOPPER[@]}"; do

		INPUTLOAD=$( echo "
	\$.getScript(\"./jsc/js/$w\", function(data, textStatus) {
		console.log(\"$w loaded\", textStatus);
	});" )

		echo -e "$INPUTLOAD" >> $FILEPOINT
 	done
	glopperGo
	echo "FALCON: appengine.js built"
stopwatchtime
