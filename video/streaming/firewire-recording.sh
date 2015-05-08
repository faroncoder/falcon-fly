#!/bin/bash

file="$1"

if [[ -z "$file" ]]; then
	file="$( uuid )"
fi

if [[ ! -z "nohup.out" ]]; then
	rm nohup.out
fi


nohup `$( dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -y -c:v libx264 -preset ultrafast -pix_fmt yuv420p -crf 25.0 -qp 0 -g 60 -c:a libfdk_aac -f mpeg "$HOME/$file.mpg" >/dev/null )` & sleep 3; ffplay $HOME/$file.mpg

exit 0
