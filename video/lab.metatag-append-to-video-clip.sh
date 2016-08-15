#!/bin/bash
startgreen=`date +%s`
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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
