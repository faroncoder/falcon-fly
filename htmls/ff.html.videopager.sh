#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
# if [[ "$FILEID" == "" ]]; then
#     echo -n "_info Which file to pinpoint? "
#     read FILEID
# fi

if [[ "$1" == "" ]]; then
	echo "`_no` filename? "
	doneTime
else
## Variablize the input
	FILEID="$1"
## if 2nd argument is empty
	if [[ "$2" == "" ]]; then
		echo "`_no` url? "
## exit
		doneTime
	else
## otherwise we variablize the 2nd agrument
		GETURL="$2"
	fi
## check if directory '.jsc' exists
	if [[ ! -d "$PWD/.jsc" ]]; then
## fire the command to resolve the missing directory
	    /usr/local/bin/ff.html.glopper
	fi
## formating the 2nd agrumenet into a string for command pushing
	LOCURL=`echo $GETURL | sed 's/https:\/\///g' | sed 's/http:\/\///g'`
## configuring 1st arugment into pieces and formating urls for the document printing

    DOMAIN=`echo $LOCURL | cut -d'/' -f1`

    FILEI=`basename $FILEID`
    GETD=`dirname $FILEI`
    PREFILE=`echo $FILEI | rev | cut -d'.' -f2 | rev`
    PREEXT=`echo $FILEI | rev | cut -d'.' -f1 | rev`
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


#/usr/local/bin/ff.media.thumbnailer "$FILEI"

JQUERYLIB="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
JSC="./.jsc"
JSCJ="$JSC/js"
JSCC="$JSC/css"

DocVideo="<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>$PREFILE</title>
        <link rel=\"stylesheet\" href=\"$JSCC/cssengine.css\" />
        <link rel=\"stylesheet\" href=\"$JSCC/mediaelement/mediaelementplayer.min.css\" />
        <link rel=\"stylesheet\" href=\"$JSCC/mediaelement/mejs-skins.css\" />
         <style>
         html { height: 100%; width: 100%; } body { min-width: 100% ; min-height:  100%; background: black;
        } video { min-height: 100%; min-width: 100%; }
        </style>
    </head>
    <body>
        <div align=\"center\">
        <video class=\"mejs-skins\" id=\"$PREFILE\" muted >
            <source src=\"$FULLHTTPmedia\" type=\"video/mp4\">
        </video>
        </div>
        <script src=\"$JQUERYLIB\"></script>
     <!--   <script src=\"$JSCJ/appengine.js\"></script> -->
        <script src=\"$JSCJ/mediaelement/mediaelement-and-player.min.js\"></script>
        <script>
        \$( document ).ready(function(){
            \$('audio,video').mediaelementplayer();
        });
        </script>
    </body>
</html>"


DocVideo1="<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>$PREFILE</title>
        <link rel=\"stylesheet\" href=\"$JSCC/cssengine.css\" />
        <link rel=\"stylesheet\" href=\"$JSCC/mediaelement/mediaelementplayer.min.css\" />
		<link rel=\"stylesheet\" href=\"$JSCC/mediaelement/mejs-skins.css\" />
		 <style>
 		 html { height: 100%; width: 100%; } body { min-width: 100% ; min-height:  100%; background: black;
 		} video { max-height: 480px; min-width: 100%; }
		</style>
	</head>
    <body>
        <div align=\"center\">
        <video class=\"mejs-skins\" id=\"$PREFILE\" muted >
	        <source src=\"$FULLHTTPmedia\" type=\"video/mp4\">
        </video>
        </div>
        <script>
        \$( document ).ready(function(){
	        \$('audio,video').mediaelementplayer();
	    });
        </script>
    </body>
</html>"

echo -e "$DocVideo" > "$FULLHTTPhtml"
echo "`_ok` $PREFILE.html created"


DOCT2="<li><a class=\"fancybox fancybox.iframe\" rel=\"collection\" href=\"$DOMAIN/.tv/$PREFILE.html/\"><img src=\"http://$DOMAIN/.priv/thumbs/$PREFILE-0.png\"></img></a></li>"
echo $DOCT2 >> transport.list

mv $FILEI $PWD/media/

fi




###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.html.videopager.sh  [ACTIVE] y

