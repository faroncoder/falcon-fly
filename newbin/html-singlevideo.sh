#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
## BEGIN

glop1="
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
    <title>BASHFILENAME</title>

  <!--  <script src=\"https://www.google.com/jsapi\"></script>
    <script type=\"text/javascript\">
    google.load(\"language\", \"1\");
    </script> -->
 <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\" type=\"text/javascript\"></script>
 <script src=\"../js/mediaelement-and-player.min.js\"></script>



<style>
    body {
        background: black;
    }
</style>

</head>
<body>

<video width=\"640\" height=\"480\" id=\"$BASHFILENAME\" controls=\"controls\">
    <source src=\"../media/$BASHFILENAME.$EXTTYPE\" type=\"video/$EXTTYPE\">
    <!-- <track kind=\"subtitles\" src=\"../cc/BASHFILENAME.vtt\" srclang=\"en\"></track>-->
    <p>Your browser leaves much to be desired.</p>
</video>

<script>
\$('audio,video').mediaelementplayer({
    // auto-select this language (instead of starting with \"None\")
    startLanguage:'en',
    // automatically translate into these languages
    translations:['es','ar','zh','ru'],
    // enable the dropdown list of languages
    translationSelector: true
});
</script>

</body>
</html>
"
function functionname($1) {

}



if [[ -d $PATHDIRHOME/jsc ]]; then
	if [[ ! -d $PATHDIRHOME/jsc/media ]]; then
		echo -n "Full path to video files? "
		read LINKF
		ln -s $LINKF $PATHDIRHOME/jsc/media
  	fi
	if [[ ! -d $PATHDIRHOME/htmls ]]; then
		mkdir -p $PATHDIRHOME/htmls
  	fi
	if [[ ! -d $PATHDIRHOME/cc ]]; then
		mkdir -p $PATHDIRHOME/cc
  	fi
  else
  	mkdir -p $PATHDIRHOME/jsc
  	$0
  	stopwatchtime
fi

echo -n "project path? [return for current location] ?"
read GETLW

if [[ -z "$GETLW" ]]; then
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$GETLW"
fi

EXTTYPE="$2"
if [[ -z "$EXTTYPE" ]]; then
    echo -n "which file type? [m:mp4|w:webm|f:flv] "
    read getEXTTYPE
    if [[ $getEXTYPE == "m" ]]; then
        EXTTYPE="mp4"
        INPUT=( `find -L $PATHDIRHOME/jsc/media -maxdepth 1 -type f -name "*.$EXTTYPE" -exec basename {} \; ` )
        for f in "${INPUT[@]}"; do
        BASHFILENAME="$( rev <<< $f | cut -d"." -f2 | rev )"
        echo $glop1 > $PATHDIRHOME/jsc/htmls/$BASHFILENAME.html
        echo "$BASHFILENAME printed"
    fi
    if [[ $getEXTYPE == "w" ]]; then
        echo "unfinished scripting here.  sorry."
        stopwatchtime
    fi
    if [[ $getEXTYPE == "f" ]]; then
        echo "unfinished scripting here.  sorry."
        stopwatchtime
    fi
fi


echo "printed"
sed -i -e "s/BASHFILENAME/$BASHFILENAME/g" ../../htmls/$BASHFILENAME.html
sed -i -e "s/EXTTYPE/$EXTTYPE/g" ../../htmls/$BASHFILENAME.html
echo "edited"



echo "printed"
sed -i -e "s/BASHFILENAME/$BASHFILENAME/g" ../../htmls/$BASHFILENAME.html
sed -i -e "s/EXTTYPE/$EXTTYPE/g" ../../htmls/$BASHFILENAME.html
echo "edited"

## END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] html-singlevideo.sh  [ACTIVE] y

