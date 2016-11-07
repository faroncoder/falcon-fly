#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
PATHGRAB=$PWD; LISTINGS=( `ls $PATHGRAB/*.mp4`,`ls $PATHGRAB/*.mkv` ); for f in "${LISTINGS[@]}"; do echo "Now working on $( basename $f )"; mediainfo $f > a.txt;  while read line; do echo $line >> b.txt; sed -i -e 's/Video Cod/video cod/g' b.txt;  done < a.txt; rm a.txt;  NEWTHIS="$( grep 'Encoding settings' b.txt | sed 's/Encoding\ settings\ ://g' )";  FARONINSERT="$( echo "\"ENCODING SETTINGS\": { $( echo $NEWTHIS | tr ',' '|' | tr '/' ','  | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\ ,\ /","/g' | sed 's/=/":"/g' ) } }" | sed 's/\[//g' | sed 's/\]//g' | sed 's/|/,/g' | sed 's/"ENCODING\ SETTINGS\ :\ /"/g' )"; MEDIAINFO="$( cat b.txt | sed '/^$/d' | sed '/Encoding settings/d' | sed 's/Audio Codec/Codec-audio/g' | sed 's/MPEG\ Audio/MPEG-audio/g' | sed 's/General/GENERAL" : {/g' |  sed 's/Video/},\nVIDEO" : {/g' | sed 's/Audio/},\nAUDIO": {/g' > c.txt; echo "} }" >> c.txt; rm b.txt; cat c.txt | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/,"},","AUDIO\\": {","/},"AUDIO": {"/g' | sed 's/,"},","VIDEO\\": {","/}, "VIDEO": {"/g' | sed 's/\["GENERAL\\" : {","/"GENERAL": { "/g' | sed 's/ : /":"/g' | sed 's/","},","/"},"/g' | sed 's/"VIDEO\\"":"{","/"VIDEO":{"/g' | sed 's/","} }"]/"} }/g' )"; rm c.txt; METATAG="$( echo "\"METATAGS\": { \"Date\": \"$( date )\", \"File\": \"$( echo $f )\",\"MD5\":\"$( md5sum $f | awk '{print $1}' )\" }," )" ;  echo "{" >> $f.json; echo $METATAG >> $f.json; echo $MEDIAINFO | sed 's/"} }/"}, FARONINSERT/g' | sed "s/FARONINSERT/$( echo $FARONINSERT)/g" >> $f.json; rename 's/.mp4.json/.json/g' $f.json;
	echo "$( basename $f ) competed!"; done
# cd $PWD
# LISTINGS=( `ls *.mp4` `ls *.mkv` );
# for f in "${LISTINGS[@]}"; do
# 	mediainfo $f > a.txt;
# 	while read line; do
# 		echo $line >> b.txt;
# 		sed -i -e 's/Advanced Video Cod/Advanced video cod/g' b.txt;
# 	done < a.txt;
# 	rm a.txt;
# 	NEWTHIS="$( grep 'Encoding settings' b.txt | sed 's/Encoding\ settings\ ://g' )";
# 	FARONINSERT="$( echo "\"ENCODING SETTINGS\": { $( echo $NEWTHIS | tr ',' '|' | tr '/' ',' | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\ ,\ /\",\"/g' | sed 's/=/\":\"/g' ) }\"" | sed 's/\[//g' | sed 's/\]//g' | sed 's/|/,/g' | sed 's/"ENCODING SETTINGS : /"/g' )";
# 	echo $NEWTHIS;
# 	echo $FARONINSERT;

# 	cat b.txt | sed '/^$/d' | sed '/Encoding settings/d' | sed 's/Audio Codec/Codec-audio/g' | sed 's/MPEG\ Audio/MPEG-audio/g' | sed 's/General/GENERAL" : {/g' |  sed 's/Video/},\nVIDEO" : {/g' | sed 's/Audio/},\nAUDIO": {/g' > c.txt;
# 	rm b.txt
# #echo "} }" >> c.txt;
# 	MEDIAINFO="$( cat c.txt | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in).\n;' | sed 's/,"},","AUDIO\\": {","/},"AUDIO": {"/g' | sed 's/,"},","VIDEO\\": {","/}, "VIDEO": {"/g' | sed 's/\["GENERAL\\" : {","/"GENERAL": { "/g' | sed 's/ : /":"/g' | sed 's/","},","/"},"/g' | sed 's/"VIDEO\\"":"{","/"VIDEO":{"/g' | sed 's/","} }"]/"} }/g' )";
# 	METATAG="$( echo "\"METATAGS\": { \"Date\": \"$( date )\", \"File\": \"$( echo $f )\",\"MD5\":\"$( md5sum $f | awk '{print $1}' )\" }," )";

# 	echo "{" >> $f.json
# 	echo $METATAG >> $f.json
# 	echo $MEDIAINFO | sed 's/"} }/"}, FARONINSERT/g' | sed "s/FARONINSERT/$( echo $FARONINSERT)/g" >> $f.json;
# 	echo "}" >> $f.json
# 	rename 's/.mp4.json/.json/g' $f.json;
# 	rm c.txt
# done

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.metatag-append-to-video-clip.sh  [ACTIVE] y

