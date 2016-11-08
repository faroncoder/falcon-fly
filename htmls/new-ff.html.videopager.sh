#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader;
 #################### START

<<<<<<< HEAD
# if [[ "$FILEID" == "" ]]; then
#     echo -n "_info Which file to pinpoint? "
#     read FILEID
# fi

if [[ "$1" == "" ]]; then
	echo "$_no filename? "
	doneTime
else
## Variablize the input
	FILEID="$1"
## if 2nd argument is empty
	if [[ "$2" == "" ]]; then
		echo "$_no url? "
## exit
		doneTime
	else
## otherwise we variablize the 2nd agrument
		GETURL="$2"
	fi
## check if directory '.jsc' exists
	if [[ ! -d "$PWD/.jsc" ]]; then 
## fire the command to resolve the missing directory
	   source /usr/local/bin/ff.html.glopper
	fi
## formating the 2nd agrumenet into a string for command pushing
	LOCURL=`echo $GETURL | sed 's/https:\/\///g' | sed 's/http:\/\///g'`
## configuring 1st arugment into pieces and formating urls for the document printing 
=======
FILEID=$1
GETUR=$2

if [[ "$FILEID" == "" ]]; then
    echo -n "_info Which file to pinpoint? "
    read FILEID
fi

if [[ "$GETUR" == "" ]]; then
	echo -n "_info Location of URL: http(s)://"
	read GETUR
fi
    LOCURL=`echo $GETUR | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
 
>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43
    FILEI=`basename $FILEID`
    GETD=`dirname $FILEI`
    PREFILE=`echo $FILEI | rev | cut -d'.' -f2 | rev`
    PREEXT=`echo $FILEI | rev | cut -d'.' -f1 | rev`
<<<<<<< HEAD
    ME=`echo $PWD | sed 's/\/srv\/www\/default\/htdocs//g' `
    #FULLHTTP="https://$LOCURL`echo $PWD | tr '/' '|' | sed 's/|srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`"
	FULLHTTP="http://$LOCURL$ME"
    FULLHTTPmedia="$FULLHTTP/media/$PREFILE.$PREEXT"
    FULLHTTPhtml="$GETD/$PREFILE.html"

	if [[ ! -d "$PWD/media" ]]; then
		echo "$_warn directory 'media' created"
	    mkdir -p "$PWD/media" 2> /dev/null;
	fi
#	ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 $PWD/thumbs/$PREFILE.png < /dev/null
#	echo "$_warn $PREFILE.png thumbed"


source /usr/local/bin/ff.media.thumbnailer "$FILEI"  

JQUERYLIB="jquery-1.12.4.min.js"
JSC="./.jsc"
JSCJ="$JSC/js"
JSCC="$JSC/css"
=======
    ME=
    FULLHTTP="https://$LOCURL`echo $PWD | tr '/' '|' | sed 's/|srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`"

    FULLHTTPmedia="$FULLHTTP/media/$PREFILE.$PREEXT"
    FULLHTTPhtml="$GETD/$PREFILE.html"
if [[ ! -d "$PWD/media" ]]; then 
    mkdir -p $PWD/media 2> /dev/null    
fi

if [[ ! -d "$PWD/.jsc" ]]; then 
   source /usr/local/bin/ff.html.glopper
fi

source /usr/local/bin/ff.media.thumbnailer "$FILEI"

>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43
DocVideo="<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>$PREFILE</title>
<<<<<<< HEAD
        <link rel=\"stylesheet\" href=\"$JSCC/cssengine.css\" />
        <link rel=\"stylesheet\" href=\"$JSCC/mediaelement/mediaelementplayer.min.css\" />
		<link rel=\"stylesheet\" href=\"$JSCC/mediaelement/mejs-skins.css\" /> 
		 <style>
 		 html { height: 100%; width: 100%; } body { min-width: 100% ; min-height:  100%; background: black;
 		} video { min-height: 100%; min-width: 100%; }
		</style> 
	</head>
    <body>
        <video class=\"mejs-skins\" id=\"$PREFILE\" muted > 
	        <source src=\"$FULLHTTPmedia\" type=\"video/mp4\"> 
        </video>
        <script src=\"https://code.jquery.com/$JQUERYLIB\"></script>
        <script src=\"$JSCJ/appengine.js\"></script>
        <script src=\"$JSCJ/mediaelement/mediaelement-and-player.min.js\"></script> 
        <script>
        \$( document ).ready(function(){
	        \$('audio,video').mediaelementplayer();
=======
        <link rel=\"stylesheet\" href=\"./.jsc/css/cssengine.css\" />
        <link rel=\"stylesheet\" href=\"./.jsc/css/mediaelement/mediaelementplayer.min.css\" />
		<link rel=\"stylesheet\" href=\"./.jsc/css/mediaelement/mejs-skins.css\" /> 
		 <style>
 		 html { height: 100%; width: 100%; } body { min-width: 100% ; min-height:  100%; background: black;
 		} video { min-height: 100%; min-width: 800px; }
		</style> 
	</head>
    <body>
        <video align=\"center\" class=\"mejs-skins\" id=\"$PREFILE\" controls=\"muted\"> 
	        <source src=\"$FULLHTTPmedia\" type=\"video/mp4\"> 
        </video>
        <script src=\"https://code.jquery.com/jquery-1.12.4.min.js\"></script>
        <script src=\"./.jsc/js/appengine.js\"></script>
        <script src=\"./.jsc/js/mediaelement/mediaelement-and-player.min.js\"></script> 
        <script>
        \$( document ).ready(function(){
	        \$('audio,video').mediaelementplayer({
    	        defaultVideoHeight: 480,
        	    startLanguage: 'en',
            	stretching: 'auto'
	        });
>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43
	    });
        </script>
    </body>
</html>"
<<<<<<< HEAD
echo -e "$DocVideo" > "$FULLHTTPhtml"
echo "_ok $PREFILE.html created"
mv $FILEI $PWD/media/

fi
=======
echo "$_warn creating $PREFILE.html"
echo -e "$DocVideo" > "$FULLHTTPhtml"
mv $FILEI $PWD/media/


>>>>>>> 68abc402eb9935b362c9bf7374716bdfe4020a43


####################STOP
doneTime
### [FILE] ff.html.videopager.sh [ACTIVE] y
