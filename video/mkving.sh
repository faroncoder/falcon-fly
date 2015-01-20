#!/bin/bash
cd /home/faron/var/streamings/processes/
INPUTZ="$(  find start-raw -maxdepth 1 -type f  ! -name '*.mp4'  ! -name '*.sh'  ! -name '*.txt' | head -n1 )"
if [ -z "$INPUTZ" ]
	then
		echo "no more file left"
		exit 0
	else
		INPUT="$( basename $INPUTZ )"
		PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
                                    avidemux "$INPUT" --save
                                    read respondAvidemux
                                    echo $respondAvidemux
                                    mkvmerge --output "$PREFILE.mkv" --language 0:eng --cues 0:all --default-track 0:no --compression 0:none --language 1:eng "$INPUT" --track-order 0:0,0:1  < /dev/null
                                    rm $INPUT
                                    mv "$PREFILE.mkv" end-mkv
fi
/home/faron/bin/core/scripting/faron-scriptor/video/./mkv.sh < /home/faron/bin/core/scripting/faron-scriptor/video/mkv-respond.txt
exit 0
