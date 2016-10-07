#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN

LOCURL=$1
FILEID=$2

if [[ "$LOCURL" == "" ]]; then
	echo -n "$Finfo Location of URL: http(s)://"
	read LOCURL
fi

if [[ "$FILEID" == "" ]]; then
	echo -n "$Finfo Which file to pinpoint? "
	read FILEID
fi

IDURL="$LOCURL/$FILEID.mp4"
OUTHTML="$PWD/$FILEID.html"
DocVideo="<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>$1</title>
        <link rel=\"stylesheet\" href=\"./.jsc/css/cssengine.css\" />
        <link rel=\"stylesheet\" href=\"./.jsc/css/mediaelement/mediaelementplayer.min.css\" />
		<link rel=\"stylesheet\" href=\"./.jsc/css/mediaelement/mejs-skins.css\" /> 
		 <style>
 		 html { height: 100%; width: 100%; } body { min-width: 100% ; min-height:  100%; background: black;
 		} video { min-height: 100%; min-width: 800px; }
		</style> 
	</head>
    <body>
        <video align=\"center\" class=\"mejs-skins\" id=\"$1\" controls muted> 
	        <source src=\"$IDURL\" type=\"video/mp4\"> 
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
	    });
        </script>
    </body>
</html>"
echo "$Fwarn creating $OUTHTML"
echo $DocVideo > "$OUTHTML"
echo "$Fok"

################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/htmls/ff.html.videopager.sh [ACTIVE] y


