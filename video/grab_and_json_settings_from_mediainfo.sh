#LISTINGS=( `ls *.mp4` ); for f in "${LISTINGS[@]}"; do mediainfo $f > x.txt; NEWTHIS="$( grep 'Encoding settings' x.txt | sed 's/Encoding\ settings\ ://g' )"; echo "{ \"Enconding settings\": { $( echo $NEWTHIS | tr ',' '|' | tr '/' ','  | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\ ,\ /","/g' | sed 's/=/":"/g' ) } }" | sed 's/\[//g' | sed 's/\]//g' | sed 's/|/,/g' | sed 's/"Encoding\ settings\ :\ /"/g' > "$f.json"; rename 's/.mp4.json/.json/g' "$f.json"; rm x.txt; rm c.txt; done



#WORKING CODE

PATHGRAB=$PWD; LISTINGS=( `ls $PATHGRAB/*.mp4` ); for f in "${LISTINGS[@]}"; do mediainfo $f > a.txt;  while read line; do echo $line >> b.txt; sed -i -e 's/Video Cod/video cod/g' b.txt;  done < a.txt; rm a.txt;  NEWTHIS="$( grep 'Encoding settings' b.txt | sed 's/Encoding\ settings\ ://g' )";  FARONINSERT="$( echo "\"ENCODING SETTINGS\": { $( echo $NEWTHIS | tr ',' '|' | tr '/' ','  | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\ ,\ /","/g' | sed 's/=/":"/g' ) } }" | sed 's/\[//g' | sed 's/\]//g' | sed 's/|/,/g' | sed 's/"ENCODING\ SETTINGS\ :\ /"/g' )"; MEDIAINFO="$( cat b.txt | sed '/^$/d' | sed '/Encoding settings/d' | sed 's/Audio Codec/Codec-audio/g' | sed 's/MPEG\ Audio/MPEG-audio/g' | sed 's/General/GENERAL" : {/g' |  sed 's/Video/},\nVIDEO" : {/g' | sed 's/Audio/},\nAUDIO": {/g' > c.txt; echo "} }" >> c.txt; rm b.txt; cat c.txt | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/,"},","AUDIO\\": {","/},"AUDIO": {"/g' | sed 's/,"},","VIDEO\\": {","/}, "VIDEO": {"/g' | sed 's/\["GENERAL\\" : {","/"GENERAL": { "/g' | sed 's/ : /":"/g' | sed 's/","},","/"},"/g' | sed 's/"VIDEO\\"":"{","/"VIDEO":{"/g' | sed 's/","} }"]/"} }/g' )";  METATAG="$( echo "\"METATAGS\": { \"Date\": \"$( date )\", \"File\": \"$( echo $f )\",\"MD5\":\"$( md5sum $f | awk '{print $1}' )\" }," )" ;  echo "{" >> $f.json; echo $METATAG >> $f.json; echo $MEDIAINFO | sed 's/"} }/"}, FARONINSERT/g' | sed "s/FARONINSERT/$( echo $FARONINSERT)/g" >> $f.json; rename 's/.mp4.json/.json/g' $f.json; done
