#!/bin/bash
startgreen=`date +%s`

file="$1"

if [[ -z "$file" ]]; then
	file="$( uuid )"
fi

if [[ ! -z "nohup.out" ]]; then
	rm nohup.out
fi


nohup `$( dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -y -c:v libx264 -preset ultrafast -pix_fmt yuv420p -crf 25.0 -tune zerolatency -qp 0 -g 60 -b:v 800k -maxrate 1024k -bufsize 800k -flags +global_header -c:a libfdk_aac -b:a 128k -ar 44100 -ac 2 -f mpeg "$HOME/$file.mpeg" >/dev/null )` & sleep 2 & ffplay $HOME/$file.mpeg

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
