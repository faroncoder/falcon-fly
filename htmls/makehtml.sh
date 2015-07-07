#!/bin/bash
startgreen=`date +%s`
BINPULL="$HOME/.falcon/scripting/falcon-fly/htmls/VAULT"
faceboxdoc="
&lt;!DOCTYPE html&gt;
&lt;html&gt;
	&lt;head&gt;
		&lt;title&gt;&lt;/title&gt;
		&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot; /&gt;
		&lt;!-- Add jQuery library --&gt;
		&lt;script type=&quot;text/javascript&quot; src=&quot;./jsc/js/1.10.1.min.js&quot;&gt;&lt;/script&gt;
		&lt;!-- Add mousewheel plugin (this is optional) --&gt;
		&lt;script type=&quot;text/javascript&quot; src=&quot;./jsc/js/mousewheel-3.0.6.pack.js&quot;&gt;&lt;/script&gt;
		&lt;!-- Add fancyBox main JS and CSS files --&gt;
		&lt;script type=&quot;text/javascript&quot; src=&quot;./jsc/js/fancybox.js&quot;&gt;&lt;/script&gt;
		&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;./jsc/css/fancybox.css&quot; media=&quot;screen&quot; /&gt;
		&lt;!-- Add Button helper (this is optional) --&gt;
		&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;./jsc/css/fancybox-buttons.css&quot; /&gt;
		&lt;script type=&quot;text/javascript&quot; src=&quot;./jsc/js/fancybox-buttons.js&quot;&gt;&lt;/script&gt;
		&lt;!-- Add Thumbnail helper (this is optional) --&gt;
		&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;./jsc/css/fancybox-thumbs.css&quot; /&gt;
		&lt;script type=&quot;text/javascript&quot; src=&quot;./jsc/js/fancybox-thumbs.js&quot;&gt;&lt;/script&gt;
		&lt;!-- Add Media helper (this is optional) --&gt;
		&lt;script type=&quot;text/javascript&quot; src=&quot;./jsc/js/fancybox-media.js&quot;&gt;&lt;/script&gt;
		&lt;script type=&quot;text/javascript&quot;&gt;
			\\\$(document).ready(function() {
				\\\$(&#39;.fancybox&#39;).fancybox();
				\\\$(&quot;.fancybox-effects-a&quot;).fancybox({
					helpers: {
						title : {
							type : &#39;outside&#39;
						},
						overlay : {
							speedOut : 0
						}
					}
				});
				\\\$(&quot;.fancybox-effects-b&quot;).fancybox({
					openEffect  : &#39;none&#39;,
										closeEffect	: &#39;none&#39;,
					helpers : {
						title : {
							type : &#39;over&#39;
						}
					}
				});
				\\\$(&quot;.fancybox-effects-c&quot;).fancybox({
					wrapCSS    : &#39;fancybox-custom&#39;,
					closeClick : true,
					openEffect : &#39;none&#39;,
					helpers : {
						title : {
							type : &#39;inside&#39;
						},
						overlay : {
							css : {
								&#39;background&#39; : &#39;rgba(238,238,238,0.85)&#39;
							}
						}
					}
				});
				\\\$(&quot;.fancybox-effects-d&quot;).fancybox({
					padding: 0,
					openEffect : &#39;elastic&#39;,
					openSpeed  : 150,
					closeEffect : &#39;elastic&#39;,
					closeSpeed  : 150,
					closeClick : true,
					helpers : {
						overlay : null
					}
				});
				\\\$(&#39;.fancybox-buttons&#39;).fancybox({
					openEffect  : &#39;none&#39;,
					closeEffect : &#39;none&#39;,
					prevEffect : &#39;none&#39;,
					nextEffect : &#39;none&#39;,
					closeBtn  : false,
					helpers : {
						title : {
							type : &#39;inside&#39;
						},
											buttons	: {}
					},
					afterLoad : function() {
						this.title = &#39;Image &#39; + (this.index + 1) + &#39; of &#39; + this.group.length + (this.title ? &#39; - &#39; + this.title : &#39;&#39;);
					}
				});
				\\\$(&#39;.fancybox-thumbs&#39;).fancybox({
					prevEffect : &#39;none&#39;,
					nextEffect : &#39;none&#39;,
					closeBtn  : false,
					arrows    : false,
					nextClick : true,
					helpers : {
						thumbs : {
							width  : 50,
							height : 50
						}
					}
				});
				\\\$(&#39;.fancybox-media&#39;)
					.attr(&#39;rel&#39;, &#39;media-gallery&#39;)
					.fancybox({
						openEffect : &#39;none&#39;,
						closeEffect : &#39;none&#39;,
						prevEffect : &#39;none&#39;,
						nextEffect : &#39;none&#39;,
						arrows : false,
						helpers : {
							media : {},
							buttons : {}
						}
					});
				\\\$(&quot;#fancybox-manual-a&quot;).click(function() {
					\\\$.fancybox.open(&#39;1_b.jpg&#39;);
				});
				\\\$(&quot;#fancybox-manual-b&quot;).click(function() {
					\\\$.fancybox.open({
						href : &#39;iframe.html&#39;,
						type : &#39;iframe&#39;,
						padding : 5
					});
				});
				\\\$(&quot;#fancybox-manual-c&quot;).click(function() {
					\\\$.fancybox.open([
						{
							href : &#39;1_b.jpg&#39;,
							title : &#39;My title&#39;
						}, {
							href : &#39;2_b.jpg&#39;,
							title : &#39;2nd title&#39;
						}, {
							href : &#39;3_b.jpg&#39;
						}
					], {
						helpers : {
							thumbs : {
								width: 75,
								height: 50
							}
						}
					});
				});
			});
		&lt;/script&gt;
		&lt;style type=&quot;text/css&quot;&gt;
			.fancybox-custom .fancybox-skin {
				box-shadow: 0 0 50px #222;
			}
			body {
				max-width: 700px;
				margin: 0 auto;
			}
		&lt;/style&gt;
	&lt;/head&gt;
	&lt;body&gt;
		&lt;!-- &lt;p&gt;
			&lt;a class=&quot;fancybox&quot; href=&quot;./jsc/img/1_b.jpg&quot; data-fancybox-group=&quot;gallery&quot; title=&quot;Lorem ipsum dolor sit amet&quot;&gt;&lt;img src=&quot;./jsc/img/1_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;
			&lt;a class=&quot;fancybox-effects-a&quot; href=&quot;5_b.jpg&quot; title=&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit&quot;&gt;&lt;img src=&quot;./jsc/img/5_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;
			&lt;a class=&quot;fancybox-buttons&quot; data-fancybox-group=&quot;button&quot; href=&quot;./jsc/img/1_b.jpg&quot;&gt;&lt;img src=&quot;./jsc/img/1_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;
			&lt;a class=&quot;fancybox-thumbs&quot; data-fancybox-group=&quot;thumb&quot; href=&quot;./jsc/img/4_b.jpg&quot;&gt;&lt;img src=&quot;./jsc/img/4_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;

			&lt;li&gt;&lt;a class=&quot;fancybox-media&quot; href=&quot;http://www.youtube.com/watch?v=opj24KnzrWo&quot;&gt;Youtube&lt;/a&gt;&lt;/li&gt;
		&lt;/p&gt;

		&lt;h3&gt;Different effects&lt;/h3&gt;

		&lt;a class=&quot;fancybox-effects-b&quot; href=&quot;5_b.jpg&quot; title=&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit&quot;&gt;&lt;img src=&quot;./jsc/img/5_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;
		&lt;a class=&quot;fancybox-effects-c&quot; href=&quot;5_b.jpg&quot; title=&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit&quot;&gt;&lt;img src=&quot;./jsc/img/5_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;
		&lt;a class=&quot;fancybox-effects-d&quot; href=&quot;5_b.jpg&quot; title=&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit&quot;&gt;&lt;img src=&quot;./jsc/img/5_s.jpg&quot; alt=&quot;&quot; /&gt;&lt;/a&gt;
		&lt;h3&gt;Open manually&lt;/h3&gt;
		&lt;ul&gt;
			&lt;li&gt;&lt;a id=&quot;fancybox-manual-a&quot; href=&quot;javascript:;&quot;&gt;Open single item&lt;/a&gt;&lt;/li&gt;
			&lt;li&gt;&lt;a id=&quot;fancybox-manual-b&quot; href=&quot;javascript:;&quot;&gt;Open single item, custom options&lt;/a&gt;&lt;/li&gt;
			&lt;li&gt;&lt;a id=&quot;fancybox-manual-c&quot; href=&quot;javascript:;&quot;&gt;Open gallery&lt;/a&gt;&lt;/li&gt;
		&lt;/ul&gt;
		&lt;h3&gt;Various types&lt;/h3&gt;
		&lt;p&gt;
			fancyBox will try to guess content type from href attribute but you can specify it directly by adding classname (fancybox.image, fancybox.iframe, etc).
		&lt;/p&gt;
		&lt;ul&gt;
			&lt;li&gt;&lt;a class=&quot;fancybox&quot; href=&quot;./jsc/img/#inline1&quot; title=&quot;Lorem ipsum dolor sit amet&quot;&gt;Inline&lt;/a&gt;&lt;/li&gt;
			&lt;li&gt;&lt;a class=&quot;fancybox fancybox.ajax&quot; href=&quot;ajax.txt&quot;&gt;Ajax&lt;/a&gt;&lt;/li&gt;
			&lt;li&gt;&lt;a class=&quot;fancybox fancybox.iframe&quot; href=&quot;iframe.html&quot;&gt;Iframe&lt;/a&gt;&lt;/li&gt;
			&lt;li&gt;&lt;a class=&quot;fancybox&quot; href=&quot;./jsc/img/http://www.adobe.com/jp/events/cs3_web_edition_tour/swfs/perform.swf&quot;&gt;Swf&lt;/a&gt;&lt;/li&gt;
		&lt;/ul&gt;
		&lt;div id=&quot;inline1&quot; style=&quot;width:400px;display: none;&quot;&gt;
			&lt;h3&gt;Etiam quis mi eu elit&lt;/h3&gt;
			&lt;p&gt;
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis mi eu elit tempor facilisis id et neque. Nulla sit amet sem sapien. Vestibulum imperdiet porta ante ac ornare. Nulla et lorem eu nibh adipiscing ultricies nec at lacus. Cras laoreet ultricies sem, at blandit mi eleifend aliquam. Nunc enim ipsum, vehicula non pretium varius, cursus ac tortor. Vivamus fringilla congue laoreet. Quisque ultrices sodales orci, quis rhoncus justo auctor in. Phasellus dui eros, bibendum eu feugiat ornare, faucibus eu mi. Nunc aliquet tempus sem, id aliquam diam varius ac. Maecenas nisl nunc, molestie vitae eleifend vel, iaculis sed magna. Aenean tempus lacus vitae orci posuere porttitor eget non felis. Donec lectus elit, aliquam nec eleifend sit amet, vestibulum sed nunc.
			&lt;/p&gt;
		&lt;/div&gt; --&gt;
		&lt;!--MEDIAINSERTS--&gt;
	&lt;/body&gt;
&lt;/html&gt;
"

videobackbone="
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
		<title>FILENAMEME</title>
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
		<video width=\"760\" height=\"570\" id=\"FILENAMEME\" controls=\"controls\">
			<source src=\"../media/FILENAMEME.mp4\" type=\"video/EXTTYPE\">
			<track kind=\"captions\" src=\"../cc/FILENAMEME.vtt\" srclang=\"en\" />
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
	videodynamicfront="&lt;!DOCTYPE html&gt; &lt;html lang=&quot;en&quot;&gt; &lt;head&gt; &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot;&gt; &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=Edge,chrome=1&quot;&gt; &lt;!-- &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt; --&gt; &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot;&gt; &lt;meta name=&quot;description&quot; content=&quot;&quot;&gt; &lt;meta name=&quot;author&quot; content=&quot;faron&quot;&gt; &lt;title&gt;&lt;/title&gt; &lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;./jsc/css/cssengine.css&quot; /&gt; &lt;!--[if lt IE 9]&gt; &lt;script src=&quot;//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js&quot;&gt;&lt;/script&gt; &lt;![endif]--&gt; &lt;script src=&quot;https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt; &lt;script src=&quot;./jsc/js/jsengine.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt; &lt;style&gt; .imghold { min-height: 240px; height: 241px; } &lt;/style&gt; &lt;script type=&quot;text/javascript&quot;&gt; \\\$(document).ready(function(\\\$){ \\\$(&#39;body&#39;).css(&#39;background-color&#39;,&#39;#000&#39;); \\\$(&quot;.lazy&quot;).lazyload({ effect : &quot;fadeIn&quot; }); }); &lt;/script&gt; &lt;/head&gt; &lt;body&gt; &lt;div id=&quot;tvbox&quot; class=&quot;container&quot;&gt; &lt;div class=&quot;col-xs-12 col-sm-9 col-md-9 col-lg-4 &quot;&gt; &lt;?php if (\\\$handle = opendir(&#39;./jsc/media&#39;)) { while (false !== (\\\$entry = readdir(\\\$handle))) { \\\$files = array(); if (\\\$entry != &quot;.&quot; &amp;&amp; \\\$entry != &quot;..&quot; &amp;&amp; \\\$entry != &quot;.html&quot; &amp;&amp; \\\$entry != &quot;src&quot; &amp;&amp; \\\$entry != &quot;htmls&quot; &amp;&amp; \\\$entry != &quot;thumbs&quot; &amp;&amp; \\\$entry != is_dir(\\\$entry)) { \\\$name = pathinfo(\\\$entry)[&#39;filename&#39;]; echo &#39;&lt;div valign=&quot;middle&quot; align=&quot;center&quot; class=&quot;col-xs-4 col-sm-4 col-md-3 col-lg-3 imghold&quot;&gt;&lt;a class=&quot;lightbox&quot; rel=&quot;porn&quot; href=&quot;./jsc/htmls/&#39;.\\\$name.&#39;.html?lightbox[iframe]=true&amp;lightbox[width]=790&amp;lightbox[height]=550&amp;light[modal]=true&quot;&gt;&lt;img class=&quot;lazy view&quot; data-original=&quot;jsc/thumbs/&#39;.\\\$name.&#39;.png&quot; src=&quot;./jsc/thumbs/&#39;.\\\$name.&#39;.png&quot; style=&quot;width=22%; height=22%;&quot;&gt;&lt;/img&gt;&lt;/a&gt;&lt;/div&gt;&#39;; } } closedir(\\\$handle); } ?&gt; &lt;/div&gt; &lt;/div&gt; &lt;!-- Javascript files --&gt; &lt;script type=&quot;text/javascript&quot;&gt; \\\$(document).ready(function() { \\\$(&#39;.lightbox&#39;).lightbox(); \\\$(&#39;.jquery-lightbox-background&#39;).css(&#39;background-color&#39;,&#39;#000&#39;); \\\$(&#39;html&#39;).css(&#39;background-color&#39;,&#39;#000&#39;); }); &lt;/script&gt; &lt;/body &lt;/html&gt;"

glop1="
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
    <title>BASHFILENAME</title>

    <script src=\"https://www.google.com/jsapi\"></script>
    <script type=\"text/javascript\">
    google.load(\"language\", \"1\");
    </script>


    <script src=\"https://code.jquery.com/jquery-1.11.0.min.js\" type=\"text/javascript\"></script>
    <script src=\"./jsc/js/jsengine.js\"></script>

    <link rel=\"stylesheet\" href=\"./jsc/css/cssengine.css\" />
<style>
    body {
        background: black;
    }
</style>

</head>
<body>

<video width=\"640\" height=\"480\" id=\"LOCA\" controls=\"controls\">
    <source src=\"FILELOCA/LOCA.EXTTYPE\" type=\"video/EXTTYPE\">
    <track kind=\"subtitles\" src=\"../cc/LOCA.vtt\" srclang=\"en\"></track>
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

captionfile="
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
	"
	function populateoption {
	find $BINPULL -type f ! -name '*old*' -exec basename {} \;
	echo -n "which package to install (full filename) ? "
	read PICK
	cp "$BINPULL/$PICK" "$PWD/$PICK"
	TARTYPE=$( echo $PICK | rev | cut -d "." -f1 | rev )
	if [[ "$TARTYPE" == "bz2" ]]; then
		tar -jvxf $PICK
	else
		tar -zvxf $PICK
	fi
	rm $PICK
	}
	populateoption
	echo -n "which video type file to be bind to new html? "
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
	sudo mkdir -p ./jsc/htmls
	sudo mkdir -p ./jsc/media
	sudo chown -R www-data:www-data $PWD
	sudo chmod -R 775 $PWD



#	echo $faceboxdoc |  perl -MHTML::Entities -pe 'decode_entities($_)' | sed 's/\\\$/$/g' > "$PWD/facebox.html"
echo $videobackbone > "$PWD/facebox.html"
	for f in "${orderfiles[@]}"; do

	NEWLINEINSERT="<li><a class=\"fancybox-media\" href=\".\/jsc\/media\/$f\"><\/a><\/li>"
	sed -i "/MEDIAINSERTS/a $NEWLINEINSERT" "$PWD/facebox.html"
	mv $f "$PWD/jsc/media/"




	# echo $videodynamicfront |  perl -MHTML::Entities -pe 'decode_entities($_)' | sed 's/\\\$/$/g' > "$PWD/dynamic.php"

	# for f in "${orderfiles[@]}"; do
	# NAME="$( rev <<< "$f" | cut -d "." -f2 | rev )"
	# printf "$captionfile" > "$PWD/jsc/cc/$NAME.vtt"

	# mv $f "$PWD/jsc/media/"
	# printf "$videobackbone" > "$PWD/jsc/htmls/$NAME.html"
	# sed -i -e "s/FILENAMEME/$NAME/g" > "./jsc/htmls/$NAME.html"
	# sed -i -e "s/FILELOCA/$FILELOCA/g" "./jsc/htmls/$NAME.html"
	# sed -i -e "s/\/EXTTYPE/\/$EXTTYPE/g" "./jsc/htmls/$NAME.html"
	# sed -i -e "s/EXT/$EXT/g" "./jsc/htmls/$NAME.html"
	done
	/home/faron/.bin/cssglop
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
	# 	/home/faron/.bin/flv-tsx-er
	# fi
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
