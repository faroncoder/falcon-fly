#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;

#################### BEGIN

FILEID=$1
GETUR=$2

if [[ "$FILEID" == "" ]]; then
    echo -n "$Finfo Which file to pinpoint? "
    read FILEID
fi

if [[ "$GETUR" == "" ]]; then
	echo -n "$Finfo Location of URL: http(s)://"
	read GETUR
fi
    LOCURL=`echo $GETUR | sed 's/http:\/\///g' |  sed 's/https:\/\///g' `
 
    FILEI=`basename $FILEID`
    GETD=`dirname $FILEI`
    PREFILE=`echo $FILEI | rev | cut -d'.' -f2 | rev`
    PREEXT=`echo $FILEI | rev | cut -d'.' -f1 | rev`
    ME=
    FULLHTTP="https://$LOCURL`echo $PWD | tr '/' '|' | sed 's/|srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/'`"

    FULLHTTPmedia="$FULLHTTP/media/$PREFILE.$PREEXT"
    FULLHTTPhtml="$GETD/$PREFILE.html"
if [[ ! -d "$PWD/media" ]]; then 
    mkdir -p $PWD/media 2> /dev/null    
fi

if [[ ! -d "$PWD/.jsc" ]]; then 
    /usr/local/bin/ff.html.glopper
fi

/usr/local/bin/ff.media.thumbnailer "$FILEI"

DocVideo="<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>$PREFILE</title>
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
	    });
        </script>
    </body>
</html>"
echo "$Fwarn creating $PREFILE.html"
echo -e "$DocVideo" > "$FULLHTTPhtml"
mv $FILEI $PWD/media/





################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/htmls/ff.html.videopager.sh [ACTIVE] y


