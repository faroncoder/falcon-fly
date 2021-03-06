#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

_PROJ=$PWD
_DOCPATH=/srv/www/default/htdocs
_BASEPATH="$PWD/.jsc"
_Type=""
_fileName=""
_SWITCH="$_BASEPATH/$_Type"


if [[ ! -d "$_PROJ/.jsc" ]]; then
	if [[ ! -d "$_DOCPATH/.jsc" ]]; then
		cd $_DOCPATH 1> /dev/null
		sudo tar -jxvf /home/users/faron/.falcon/scripts/htmls/VAULT/jsc-build.tar.bz2
		sudo chown -R www-data:faron $_DOCPATH
		sudo chown www-data:faron $_DOCPATH/*
		sudo chmod 775 $_DOCPATH/*
		sudo chmod -R 775 $_DOCPATH
		cd $_PROJ 1> /dev/null
#		mv $_PROJ/jsc $_PROJ/.jsc 2> /dev/null
	else
		ln -s "$_DOCPATH/.jsc" 2> /dev/null
	fi
fi

### Search for duplicated links inside .jsc and deletem them
GET=( `find $PWD/.jsc -maxdepth 3 -type l` ); for j in "${GET[@]}"; do IDM=`basename $j`;  if [[ "$IDM" != ".jsc" ]]; then j=""; else  rm $j; fi;  done

glopCSS() {
	RESULT=`find -L $PWD/.jsc/css -maxdepth 1 -name '*.css' ! -name 'cssengine.css' | wc -l`
	sudo su -c "echo \"@charset \"UTF-8\";\" > \"$_fileTarget\""
	sudo su -c "echo \"@import url('https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css');\" >> \"$_fileTarget\""
	sudo su -c "echo \"@import url('https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css');\" >> \"$_fileTarget\""

	for b in "${GETFILES[@]}"; do
		INJECTION="@import url(`printf  \"'$b'\"`);"
	 	sudo su -c "echo \"$INJECTION\" >> $_fileTarget"
	done
	_Type="css"
	echo "_stat $RESULT $_Type files glopped"
}

glopJS() {

		RESULT=`find -L $PWD/.jsc/js -maxdepth 1 -name '*.js' ! -name 'appengine.js' ! -name 'jquery-ui*.js'  ! -name 'bootstrap*.js' ! -name 'angular*.js' ! -name '*ie*.js' | wc -l`

	sudo su -c "echo \"\$.getScript('https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js', function(data, textStatus) {
		console.log('tether.js loaded', textStatus); });
\$.getScript('https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js', function(data, textStatus) {
		console.log('jquery-ui.min.js loaded', textStatus); });
\$.getScript('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.5/js/bootstrap.min.js', function(data, textStatus) {
		console.log('bootstrap.min.js loaded', textStatus); });
\$.getScript('https://cdnjs.cloudflare.com/ajax/libs/angular.js/2.0.0-beta.17/angular2.min.js', function(data, textStatus) {
		console.log('angular.min.js loaded', textStatus); });
\$.getScript('https://cdnjs.cloudflare.com/ajax/libs/jStorage/0.4.12/jstorage.min.js', function(data, textStatus) {
		console.log('jstorage.js loaded', textStatus);
});\" > $_fileTarget"
 	for w in "${GETFILES[@]}"; do
		INPUTLOAD="
\$.getScript('./.jsc/js/$w', function(data, textStatus) {
		console.log('$w loaded', textStatus);
	});"
		sudo su -c "echo \"$INPUTLOAD\" >> $_fileTarget"
 	done
	GETFILES=""
	_Type="js"
	echo "_stat $RESULT $_Type files glopped"
}


_fileTarget="$PWD/.jsc/css/cssengine.css"
GETFILES=( `find -L $PWD/.jsc/css -maxdepth 1 -type f -name '*.css' ! -name 'cssengine.css' -exec basename {} \; ` )
glopCSS
_fileTarget="$PWD/.jsc/js/appengine.js"
GETFILES=( `find -L $PWD/.jsc/js -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'jquery-ui*.js'  ! -name 'bootstrap*.js' ! -name 'angular*.js' ! -name '*ie*.js' -exec basename {} \; ` )
glopJS



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.html.glopper.sh  [ACTIVE] y

