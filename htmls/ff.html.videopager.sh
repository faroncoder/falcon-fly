#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
# if [[ "$FILEID" == "" ]]; then
#     echo -n "_info Which file to pinpoint? "
#     read FILEID
# fi

if [[ "$1" == "" ]]; then
	_comment="filename or bulk!"; _send=$CHR24
    _FR
	doneTime
else
## Variablize the input
	FILEID="$1"
## if 2nd argument is empty
	if [[ "$2" == "" ]]; then
		_comment="Url ? "; _send=$CHR77
        _FR
## exit
		doneTime
	else
## otherwise we variablize the 2nd agrument
		GETURL="$2"
	fi

if [[ "$3" == "" ]]; then
        _comment="Port ? "; _send=$CHR77
        _FR
## exit
        doneTime
    else
## otherwise we variablize the 2nd agrument
        PORT="$3"
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
    #HULLHTTP=`echo "https://$LOCURL" | echo $PWD | tr '/' '|' | sed 's/|srv|www|//g' | sed 's/htdocs|//g' | tr '|' '  ' | awk '{ $1=""; print $0 }' | tr '  ' '/' `
    PORTMV="7780"; PORTTM="7781"; LOCURL="192.168.1.6"; HTTP="http://$LOCURL"
    # FULLHTTP="http://$GETURL:$PORT"

    #FULLHTTPmedia="$FULLHTTP/media/$PREFILE.$PREEXT"
    FULLHTTPhtml="$FULLHTTP/$FILEI.html"

	if [[ ! -d "$PWD/htmls" ]]; then
		echo "$_warn directory 'htmls' created"
	    mkdir -p "$PWD/htmls" 2> /dev/null;
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
         html { height: 100%; width: 100%; } 
         body { min-width: 100% ; min-height:  100%; background-color: black; } 
        video { max-height: 480px; min-width: 100%; }

        </style>
        <!-- OLD CSS 
        body { min-width: 100% ; min-height:  100%; } 
        video { min-height: 100%; min-width: 100%; }
        video { max-height: 480px; min-width: 100%; }  -->
    </head>
    <body>
        <div class=\"container\" >
        <div align=\"center\">
        <video class=\"mejs-skins\" id=\"$PREFILE\" poster=\"$HTTP:$PORTTM/$PREFILE-4.png\"muted >
            <source src=\"$HTTP:$PORTMV/$PREFILE.mp4\" type=\"video/mp4\"></source>
<!--        <source src=\"$HTTP:$PORTMV/$PREFILE.webm\" type=\"video/webm\"></source>
           <track kind=\"subtitles\" src=\"$HTTP:$PORTTM/$PREFILE.srt\" srclang=\"en\" ></track>  -->   
        </video>
        </div>
        </div>
        </div>
         <script src=\"$JQUERYLIB\"></script> 
       <script src=\"$JSCJ/appengine.js\"></script> 
        <script src=\"$JSCJ/mediaelement/mediaelement-and-player.min.js\"></script>
        <script>
        \$( document ).ready(function(){
            \$('audio,video').mediaelementplayer();
            /* auto-select  */
            /*    startLanguage:'en', */
            /* translations:['es','ar','zh','ru'], */
            /* enable function */
            /* translationSelector: true */
        });
        </script>
    </body>
</html>"





echo -e "$DocVideo" > "$PWD/htmls/$PREFILE.html"
_comment="$PREFILE.html created"; _send=$CHR23;
_FG


DOCT2="<li><a class=\"fancybox fancybox.iframe\" rel=\"collection\" href=\"$DOMAIN/.tv/$PREFILE.html/\"><img src=\"http://$DOMAIN/.priv/thumbs/$PREFILE-0.png\"></img></a></li>"



#echo $DOCT2 >> transport.list



fi




###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.html.videopager.sh  [ACTIVE] y

