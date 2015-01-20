#!/bin/bash
find $PWD -maxdepth 1 -type f -name '*.mp4' ! -name '*.png' ! -name '*.webm' ! -name '*.mkv' -exec ffmpeg -i $( basename {} ) -y -ss 00:00:10.435 -f image2 -vframes 1 "$( echo {} | cut -d "." -f1 ).png" \;
rename 's/.mp4.png/.png/g' *
exit 0