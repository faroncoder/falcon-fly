#!/bin/bash
startgreen=`date +%s`
function stopwatchtime {
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
  exit 0
}
######## IGNORE ABOVE -- LOGGING PURPOSE ########
######## use 'stopwatchtime' instead of 'exit 0' ########

if [ -d $PWD/jsc ]; then
    echo "FALCON: file structure looks good"
fi

if [ ! -d $PWD/jsc/htmls ]; then
    mkdir -p $PWD/jsc/htmls
    echo "FALCON: 'htmls' folder added to jsc"
fi

if [ -d $PWD/jsc/media ]; then
    echo "FALCON: media exists - proceeding on multi-production"
    GETALLEM=( `find -L $PWD/jsc/media -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ` )
    for f in "${GETALLEM[@]}"; do
    FILENAME="$( rev <<< $f | cut -d"." -f2 | rev )"
        echo "<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>$FILENAME</title>
        <!-- <script src=\"https://www.google.com/jsapi\"></script>
        <script type=\"text/javascript\">
        google.load(\"language\", \"1\");
        </script> -->
        <link rel=\"stylesheet\" href=\"../css/mediaelementplayer.min.css\" />
        <style type=\"text/css\">
        </style>
        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\" type=\"text/javascript\"></script>
        <script src=\"../js/mediaelement-and-player.min.js\"></script>
    </head>
    <body>
        <div>
            <video width=\"640\" height=\"480\" id=\"$FILENAME\" controls=\"controls\">
                <source src=\"../media/$FILENAME.mp4\" type=\"video/mp4\">
                <!-- <source src=\"../media/$FILENAME.webm\" type=\"video/webm\"> -->
                <!-- <track kind=\"subtitles\" src=\"../cc/$FILENAME.srt\" srclang=\"en\" ></track> -->
                <p>Your browser leaves much to be desired.</p>
            </video>
        </div>

        <script>
        \$('audio,video').mediaelementplayer({
        // auto-select this language (instead of starting with \"None\")
        // startLanguage:'en',
        // automatically translate into these languages
        //translations:['es','ar','zh','ru'],
        // enable the dropdown list of languages
        //translationSelector: true
        });
        </script>
    </body>
</html>" > jsc/htmls/$FILENAME.html
        echo $FILENAME.html created
    done
fi

stopwatchtime
