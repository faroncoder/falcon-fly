#!/bin/bash -e
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcm="OK";
XeB=1455908241
function XeF {
XeE=1455908241; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
if [ "$1" ]; then

FILENAMEME=$1

#################### BEGIN
#BINPULL="/mnt/falcon/scripts/htmls/VAULT"
PREFILE=$( rev <<< "$1" | cut -d "." -f2 | rev )
EXT=$( rev <<< "$1" | cut -d "." -f1 | rev )
mkdir -p  src
mkdir -p cc
videobackbone="
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
		<title>$1</title>
		<script src=\"https://www.google.com/jsapi\"></script>
		<script type=\"text/javascript\">
		google.load(\"language\", \"1\");
		</script>
		<script src=\"https://code.jquery.com/jquery-1.11.0.min.js\" type=\"text/javascript\"></script>
		<!-- <script src=\"../js/mediaelement-and-player.min.js\"></script> -->
		<script src=\"../js/jsengine.js\"></script>
		<link rel=\"stylesheet\" href=\"../css/cssengine.css\" />
		<style>
		body {
		background: black;
		}
		</style>
	</head>
	<body>
		<video width=\"760\" height=\"570\" id=\"$1\" controls=\"controls\">
			<source src=\"src/$1\" type=\"video/$EXT\">
			<! -- <track kind=\"captions\" src=\"cc/$PREFILE.vtt\" srclang=\"en\" ></track> -->
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
	</html>"

	echo $videobackbone > "$PWD/$PREFILE.html"
	#sed -i -e  "s/FILENAMEME/$1/g" "$HOME/$PREFILE.html"
	#sed -i -e  "s/EXTTYPE/$EXT/g" "$HOME/$PREFILE.html"
if [ -f "$PWD/$PREFILE.html" ]; then
	echo "[$fcg$fcm$fco]: $PREFILE.html"
	mv "$1" src/
	if [ -f "$PWD/$PREFILE.html" ]; then
	echo "[$fcg$fcm$fco]: $1"
	fi
else
	fcm="NOPE"; echo "[$fcr$fcm$fco]"
fi

################### END
#cd $RETURN
else fcm="WARNING: Arg needed"; echo "[$fcy$fcm$fco]"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=ff.script.new active=y

