#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

INPUT="$1"
FILMSTRIPCOMMAND="-f"
LOCFILEOUT="$PWD/thumbs"
mkdir -p $LOCFILEOUT
sudo chmod -R 777 $LOCFILEOUT
FILEEXTENOUT=" "
FLIMSTRIP=" "

if [[ -z "$INPUT" ]];
	then
		echo -n "which file to thumbnail [ filename | 'a' for all ] ?   "
		read INPUT
		echo "Keep filename as PaaS/SaaS extension? [ default='n'o | 'y' = $PREFILE.$EXTREG.png ] ?  "
		read FILEEXTENOUT

				if [[ "$INPUT"=="a" ]];
					then

						find . -maxdepth 1 -type f -exec ffmpegthumbnailer -i {} -o "{}.png" -s 0 \; -exec convert -resize 340x256^ "{}.png"  "{}x.png" \; -exec convert -crop 341x256+0+341  "{}x.png" "thumbs/{}.png" \; -exec rm "*.png" \;
						rm "$INPUT.png"
						#find . -maxdepth 1 -type f -name '*.png' -exec convert -resize 340x256^ {} "$PWD/thumbs/{}" \; -exec rm {} \;
						##rm *.png
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.video.thumbnailing.sh  [ACTIVE] y

