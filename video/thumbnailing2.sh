#!/bin/bash

#INPUT="$1"
#INPUT="$(  find $PWD -maxdepth 1 -type f  -name '*.mp4' | sort | head -n1 )"
#if [ -z "$line" ]
 #   then
  #      #echo "INPUT name is needed (orginial file)"
    #    echo "no more file to convert..."
     #                   exit 1
#else
    #statements

cd "$PWD"
#find "$PWD" -maxdepth 1 -type f -name '*.png' -name '*.jpg' -exec rm {} \;

> a.list
ls -p *.mp4 >> a.list
#find $PWD -maxdepth 1 -type f -name '*.mp4' >> a.list

# sed -i -e '/.sh/d' a.list
# sed -i -e '/.list/d' a.list
# sed -i -e '/.txt/d' a.list
# sed -i -e '/.mkv/d' a.list
# sed -i -e '/.ts/d' a.list
# sed -i -e '/.tsx/d' a.list
# sed -i -e '/.webm/d' a.list

while read line
    FILE="$( rev <<< "$line" | cut -d"." -f2 | rev )"
    do
        #echo $FILE >> b.list
        ffmpeg -i "$line" -y  -ss 00:00:10.435 -f  image2 -vframes 1 "$FILE.png"  < /dev/null

done < a.list
echo "thumbnailing completed..."
exit 0
