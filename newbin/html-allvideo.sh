#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
  stopred=`date +%s`
  faronruntime=$( echo $(( $stopred - $startgreen )) )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
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
 	<link rel=\"stylesheet\" href=\"../css/mediaelementplayer.css\" />
 	<link rel=\"stylesheet\" href=\"../css/mejs-skins.css\" />
 	<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\" type=\"text/javascript\"></script>
	<script src=\"../js/mediaelement-and-player.min.js\"></script>
	<style>
    	body {
        	background-color: black;
	    }
	</style>
	</head>
	<body>
		<video width=\"85%\" height=\"85%\" id=\"BASHFILENAME\" controls=\"controls\">
	    	<source src=\"../media/BASHFILENAME.EXTTYPE\" type=\"video/EXTTYPE\">
		    <!-- <track kind=\"subtitles\" src=\"../cc/BASHFILENAME).vtt\" srclang=\"en\"></track>-->
    		<p>Your browser leaves much to be desired.</p>
		</video>
		<script>
		\$('audio,video').mediaelementplayer({
		    startLanguage:'en',
		    translations:['es'],
		    translationSelector: true
		});
		</script>
	</body>
</html>
"

echo -n "project path? [return for current location]?  "
read GETLW

if [[ -z "$GETLW" ]]; then
		PATHDIRHOME="$PWD"
	else
		PATHDIRHOME="$GETLW"
fi
if [[ -d $PATHDIRHOME/jsc ]]; then
	if [[ ! -d $PATHDIRHOME/jsc/media ]]; then
		echo -n "Full path to video files? "
		read LINKF
		ln -s $LINKF $PATHDIRHOME/jsc/media
  	fi
	if [[ ! -d $PATHDIRHOME/jsc/htmls ]]; then
		echo "creating htmls folder"
		mkdir -p $PATHDIRHOME/jsc/htmls
  	fi
	if [[ ! -d $PATHDIRHOME/jsc/cc ]]; then
		echo "creating cc folder"
		mkdir -p $PATHDIRHOME/jsc/cc
  	fi
  else
  	echo "creating jsc and exiting"
  	mkdir -p $PATHDIRHOME/jsc
  	stopwatchtime
fi

echo -n "which file type? [m:mp4|w:webm|f:flv] "
read getEXTTYPE
if [[ $getEXTTYPE == "m" ]]; then
    EXTTYPE="mp4"
    INPUT=( $( find -L $PATHDIRHOME/jsc/media -maxdepth 1 -type f -name "*.mp4" -exec basename {} \; ) )
    for f in "${INPUT[@]}"; do
    BASHFILENAME="$( rev <<< $f | cut -d"." -f2 | rev )"
    echo $glop1 | sed "s/BASHFILENAME/$( echo $BASHFILENAME )/g" | sed "s/EXTTYPE/$( echo $EXTTYPE )/g" > $PATHDIRHOME/jsc/htmls/$BASHFILENAME.html
    #sed -i -e "s/BASHFILENAME/$BASBASHFILENAME/g" $PATHDIRHOME/jsc/htmls/$BASHFILENAME.html
    #sed -i -e "s/EXTTYPE/$EXTTYPE/g" $PATHDIRHOME/jsc/htmls/$BASHFILENAME.html
    echo "$BASHFILENAME.html printed"
	done
fi
if [[ $getEXTTYPE == "w" ]]; then
    echo "unfinished scripting here.  sorry."
    stopwatchtime
fi
if [[ $getEXTTYPE == "f" ]]; then
    echo "unfinished scripting here.  sorry."
    stopwatchtime
fi


## END
stopwatchtime

