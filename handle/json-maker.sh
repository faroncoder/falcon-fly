#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
file="$1"
PREFILE="$( rev <<< "$file" | cut -d "." -f2 | rev )";
echo $PREFILE
mediainfo $file | awk -F':' '{print $1"\":\""$2}' | head -n -2 | perl -lape 's/\s+//sg' | sed '/^$/d' | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/]//g' | sed 's/\[//g' | sed 's/\\":\\"/":"/g' | sed -e 's/","/",\n/g' > tmp1.txt;
 #mediainfo $file | awk -F':' '{print $1":"$2}' |
 #sed  '/General/a ID:0' |
 #sed 's/General/{\ \"mediainfo\":\ \[\n\t{\ \"info\":\n\t\t{/g'


sed -i -e 's/"General":"",/JDFSDF-DO\nID\":\"0\"/g' tmp1.txt;
sed -i -e 's/Video":"",/JDFSDF-DONE\nDSDFE-DO\n/g' tmp1.txt;
sed -i -e 's/Audio":"",/DSDFE-DONE\nRSDFE-DO\n/g' tmp1.txt;
echo "RSDFE-DONE" >> tmp1.txt;
sed -i -e '/^$/d' *.list;
cat tmp1.txt | sed '/DSDFE-DO/,/RSDFE-DONE/d'> info.list;
sed -i -e '/JDFSDF/d' info.list;
cat tmp1.txt | sed '/JDFSDF-DO/,/DSDFE-DONE/d'> audio.list;
sed -i -e '/RSDFE/d' audio.list;
cat tmp1.txt | sed '/RSDFE-DO/,/RSDFE-DONE/d' | sed '/JDFSDF-DO/,/JDFSDF-DONE/d' > video.list;
sed -i -e '/DSDFE/d' video.list;
#rm tmp1.txt;
sed -i -e '/-DO/d' *.list;
sed -i -e '/^$/d' *.list;
sed -i -e '/\"\",/d' *.list;
sed -i -e 's/\",//g' *.list;
cat video.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\\"/\"/g' | sed 's/\[/{/g' | sed 's/\]/}/g' > video.json;
rm video.list;
cat info.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\\"/\"/g' | sed 's/\[/{/g' | sed 's/\]/}/g' > info.json;
rm info.list;
cat audio.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/\\"/\"/g' | sed 's/\[/{/g' | sed 's/\]/}/g' > audio.json;
rm audio.list;
sed 's/\"\"}/\"}' *.json;
sed -i -e 's/\"\"}/\"}/g' *.json;
######### sed 's/\"0\"/0/g' *.json ;
######### sed 's/\"1\"/1/g' *.json ;
######### sed 's/\"2\"/2/g' *.json ;
echo "{" >> final.txt ;
cat info.json > final.txt;
echo "," >> final.txt;
cat video.json >> final.txt;
echo "," >> final.txt;
cat audio.json >> final.txt;
echo "}" >> final.txt;
rm *.json;
mv final.txt $PREFILE.json;
##########cat video.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | sed 's/"/\"/g' | sed 's/\",\"/\\",\\"/g'
# sed -i -e 's/\"\n/\",\n'
# THISLINE="$( tail -n -1 )
# FIXEDLINE="$THISLINE,"
########## cat info.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq . >> info1.list
########## cat video.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq . >> video1.list
########## cat audio.list | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq . >> audio1.list
########## sed -i -e 's/\[/{\n\"object\":\[{/g' *.list
########## sed -i -e 's/\]/}\]\n}/g' *.list
########## sed -i -e 's/object/info/g' info1.list
########## sed -i -e 's/object/video/g' video1.list
########## sed -i -e 's/object/audio/g' audio1.list
########## sed -i -e 's/\"\":\"\"/d' *1.list
######### cat info1.list > a.json
######### echo "," >> a.json
######### cat video1.list >> a.json
######### echo "," >> a.json
######### cat audio1.list >> a.json
######### echo "}" >> a.json
######### echo "{" > final.json
######### cat a.json >> final.json
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] json-maker.sh  [ACTIVE] y

