#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

glop1="
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
    <title>BASHFILENAME</title>
    <link rel=\"stylesheet\" href=\"./jsc/css/cssengine.css\" />
    <script src=\"https://www.google.com/jsapi\"></script>
    <script type=\"text/javascript\">
    google.load(\"language\", \"1\");
    </script>


    <script src=\"https://code.jquery.com/jquery-1.11.0.min.js\" type=\"text/javascript\"></script>
    <script src=\"./jsc/js/appengine.js\"></script>


<style>
    body {
        background: black;
    }
</style>

</head>
<body>

<video width=\"640\" height=\"480\" id=\"BASHFILENAME\" controls=\"controls\">
    <source src=\"../media/BASHFILENAME.EXTTYPE\" type=\"video/EXTTYPE\">
    <track kind=\"subtitles\" src=\"../cc/BASHFILENAME.vtt\" srclang=\"en\"></track>
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
BASHFILENAME="index"
EXTTYPE="mp4"
echo $glop1 > ../../htmls/$BASHFILENAME.html
echo "printed"
sed -i -e "s/BASHFILENAME/$BASHFILENAME/g" ../../htmls/$BASHFILENAME.html
sed -i -e "s/EXTTYPE/$EXTTYPE/g" ../../htmls/$BASHFILENAME.html
echo "edited"
echo "opening - check your default browser"
chromium-browser http://f10/privs/raw/$BASHFILENAME.html < /dev/null

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.video-html-maker.sh  [ACTIVE] y

