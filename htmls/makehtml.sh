#!/bin/bash
BINPULL="$HOME/.falcon/scripting/falcon-fly/htmls/VALVE"

echo "
<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <!-- <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"> -->
        <meta name=\"viewport\" content=\"width=device-width\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title></title>
        <link rel=\"stylesheet\" type=\"text/css\" href=\"./jsc/css/cssengine.css\" />
        <!--[if lt IE 9]>
        <script src=\"//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js\"></script>
        <![endif]-->
        <script src=\"./jsc/js/jquery.js\" type=\"text/javascript\"></script>
        <script src=\"./jsc/js/lightbox.min.js\" type=\"text/javascript\"></script>
        <script src=\"./jsc/js/bootstrap.min.js\" type=\"text/javascript\"></script>

<style>
.imghold {
    min-height: 240px;
    height: 241px;



}

</style>

        <script type=\"text/javascript\">
        \$(document).ready(function(\$){

        \$('body').css('background-color','#000');
          \$(\".lazy\").lazyload({
                effect : \"fadeIn\"
            });


        });



        </script>
    </head>
    <body>
        <div id=\"tvbox\" class=\"container\">
            <div class=\"col-xs-12 col-sm-9 col-md-9 col-lg-4 \">
<?php
if (\$handle = opendir('./jsc/media')) {
	while (false !== (\$entry = readdir(\$handle))) {
			// to list directories too, remove '\$entry !=is_dir(\$entry)'
		\$files = array();
		if (\$entry != \".\" && \$entry != \"..\" && \$entry != \"thumbs\" && \$entry != is_dir(\$entry)) {

		\$temp = explode('.', \$entry);
		\$ext  = array_pop(\$temp);
		\$name = implode('.', \$temp);

			echo '<div valign=\"middle\" align=\"center\" class=\"col-xs-4 col-sm-4 col-md-3 col-lg-3 imghold\"><a class=\"lightbox lazy\" rel=\"porn\" href=\"./jsc/htmls/'.\$name.'.mp4?lightbox[iframe]=true&lightbox[width]=640&lightbox[height]=480&light[modal]=true\"><img class=\"view\" data-original=\"./jsc/thumbs/'.\$name.'.png\" src=\"./jsc/thumbs/'.\$name.'.png\" style=\"width=33%; height=25%;\"></img></a></div>';
		}
	}
	closedir(\$handle);
}
?>
</div>
        </div>
        <!-- Javascript files -->
        <script src=\"./jsc/js/lazyload.min.js\" type=\"text/javascript\"></script>
        <script src=\"./jsc/js/scrollstop.min.js\" type=\"text/javascript\"></script>
        <script type=\"text/javascript\">
        \$(document).ready(function() {
            \$('.lightbox').lightbox();
            \$('.jquery-lightbox-background').css('background-color','#000');
            \$('html').css('background-color','#000');



        }); //end ready
        </script>
    </body
</html>

" > $PWD/dynamic.php


function populateoption {
	find $BINPULL -type f ! -name '*old*' -exec basename {} \;
	echo -n "which package to install (full filename) ? "
	read PICK
	cp "$BINPULL/$PICK" "$PWD/$PICK"
	TARTYPE=$( echo $PICK | rev | cut -d "." -f1 | rev )
	if [ "$TARTYPE"=="bz2" ];
		then
			tar -jvxf $PICK
		else
			tar -zvxf $PICK
	fi
	rm $PICK
}

populateoption

   echo -n "which type of movie to be bind to new html? "
	read TYPE
	EXT=$( echo "$TYPE" | cut -d '.' -f2 )

orderfiles=( $( find $PWD -type f -name "*.$EXT" | rev | cut -d "/" -f1 | rev ) )
if [[ "$EXT" == "flv" ]]; then
		EXTTYPE="x-flv"
	fi

if [[ "$EXT" == "mp4" ]]; then
	EXTTYPE="mp4"
	fi
if [[ "$EXT" == "webm" ]]; then
	EXTTYPE="webm"
fi

echo -n "[f]ile or [u]rl? "
			read TYPEURL

			if [[ "$TYPEURL" == "f" ]]; then
					FILELOCA="..\/media"
			fi
			if [[ "$TYPEURL" == "u" ]]; then
					echo -n "address of url (without http:// and no tailing '/' in end of url) ? ";
					read LOCA
					FILELOCA="http:\/\/$LOCA"
			fi
		sudo mkdir -p ./jsc/cc
		sudo mkdir -p ./jsc/thumbs
for f in "${orderfiles[@]}"; do
	 	sudo ffmpeg -ss 00:01:00.000 -i $f -y -f image2 -vframes 1 "$PWD/jsc/thumbs/$f.png" >> /dev/null
		mv $f "./jsc/media/$f"
		NAME="$( rev <<< "$f" | cut -d "." -f2 | rev )"
		cat ./jsc/templates/video-backbone.html | sed "s/FILENAMEME/$( echo $NAME )/g" > "./jsc/htmls/$NAME.html"
		sed -i -e "s/FILELOCA/`echo $FILELOCA`/g" "./jsc/htmls/$NAME.html"
		sed -i -e "s/\/EXTTYPE/\/`echo $EXTTYPE`/g" "./jsc/htmls/$NAME.html"
		sed -i -e "s/EXT/`echo $EXT`/g" "./jsc/htmls/$NAME.html"


		sudo sh -c "echo
		\"
WEBVTT

1
00:00:00.700 --> 00:00:04.110
Captions describe all relevant audio for the hearing impaired.
[ Heroic music playing for a seagull ]

2
00:00:04.500 --> 00:00:05.000
[ Splash!!! ]

3
00:00:05.100 --> 00:00:06.000
[ Sploosh!!! ]

4
00:00:08.000 --> 00:00:09.225
[ Splash...splash...splash splash splash ]

5
00:00:10.525 --> 00:00:11.255
[ Splash, Sploosh again ]

6
00:00:13.500 --> 00:00:14.984
Dolphin: eeeEEEEEeeee!

7
00:00:14.984 --> 00:00:16.984
Dolphin: Squawk! eeeEEE?

8
00:00:25.000 --> 00:00:28.284
[ A whole ton of splashes ]

9
00:00:29.500 --> 00:00:31.000
Mine. Mine. Mine.

10
00:00:34.300 --> 00:00:36.000
Shark: Chomp

11
00:00:36.800 --> 00:00:37.900
Shark: CHOMP!!!

12
00:00:37.861 --> 00:00:41.193
EEEEEEOOOOOOOOOOWHALENOISE

13
00:00:42.593 --> 00:00:45.611
[ BIG SPLASH ]
\"

 >> ./jsc/cc/$NAME.vtt"

done

sudo chown -R www-data:www-data $PWD
sudo chmod -R 775 $PWD





# if [[ "$EXT"="ts" ]]; then
# 	EXTTYPE=$( echo "MP2T" )
# fi



# if [ -z "$FORMAT" ]]; then
# 	echo -n "which format to output (.ts or same type)? "
# 	read FORMAT
# 	if [[ "$FORMAT"="ts" ]] && [[ "$EXT"="flv" ]]; then
# 			echo "pass"
# 			##FIREME=$( cd jsc/media; flv-tsx-er )
# 	elif  [[ "$FORMAT"="ts" ]] && [[ "$EXT"="mp4" ]]; then
# 			echo "pass"

# 			##FIREME=$( cd jsc/media; ts-tsx-er )
# 	else
# 		FORMAT="$EXT"
# 	fi
# fi











	# if [ "$EXT"="flv" ]
	# then
	# 	cd ./jsc/media
	# 	/home/faron/bin/flv-tsx-er
	# fi



exit 0
