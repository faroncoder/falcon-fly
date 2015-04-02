#!/bin/bash

INPUT="$1"
FILMSTRIPCOMMAND="-f"
LOCFILEOUT="thumbs"
mkdir -p $LOCFILEOUT
chmod -R 777 $LOCFILEOUT
FILEEXTENOUT=" "
FLIMSTRIP=" "

if [ -z "$INPUT" ];
	then
		echo -n "which file to thumbnail [ filename | 'a' for all ] ?   "
		read INPUT
		echo "Keep filename as PaaS/SaaS extension? [ default='n'o | 'y' = $PREFILE.$EXTREG.png ] ?  "
		read FILEEXTENOUT

				if [ "$INPUT"=="a" ]
					then

						find . -maxdepth 1 -type f -exec ffmpeg -i {} -y  -ss 00:00:10.435 -f  image2 -vframes 1 "{}.png"  < /dev/null \;
						find . -maxdepth 1 -type f -name '*.png' -exec covert {} -resize 256x256\> "thumbs/{}" \; -rm {} \;
						rm *.png
						exit 0
					else
						find . -maxdepth 1 -type f -exec ffmpeg -i {} -y  -ss 00:00:10.435 -f  image2 -vframes 1 "{}.png"  < /dev/null
						rename 's/$EXTREG//g' *.png
						find . -maxdepth 1 -type f -name '*.png' -exec covert {} -resize 256x256\> thumbs/{} \;
						rm *.png
						exit 0
				fi

	else


		ffmpeg -i "$INPUT" -y  -ss 00:00:01:00 -f  image2 -vframes 1 "$INPUT.png"  < /dev/null
		covert "$INPUT.png" -resize 256x256\! "thumbs/$INPUT.png"
		rm *.png
		exit 0
				fi
	else

					else
						##  SINGLE PRINT ONLY WITH REGULAR EXT
						ffmpeg -i "$FINALIN" -y  -ss 00:00:01:00 -f  image2 -vframes 1 "$PREFILE.$EXTREG.png"  < /dev/null
						covert "$PREFILE.$EXTREG.png" -resize 256x256\! "thumbs/$PREFILE.$EXTREG.png"
						rm *.png
						exit 0



fi

PREFILE=$( rev <<< "$INPUT" | cut -d "." -f2 | rev )
EXTREG=$( rev <<< "$INPUT" | cut -d "." -f1 | rev )
WHOLEOUT="$LOCFILEOUT/$PREFILE.png"


		## SAVE PAAS/SAAS EXTENSION


		else

		##  SAVE REGULAR EXTENSION
				if [ "$INPUT"=="a" ]
					then
						## BATCH MULTIPLE PRINTS WITH REGULAR EXT
						FINALIN="{}"
						FILEEXTENOUT="$LOCFILEOUT/{}.png"
						find . -maxdepth 1 -type f -exec ffmpeg -i {} -y  -ss 00:00:10.435 -f  image2 -vframes 1 "{}.png"  < /dev/null
						rename 's/$EXTREG//g' *.png
						find . -maxdepth 1 -type f -name '*.png' -exec covert {} -resize 256x256\> thumbs/{} \;
						rm *.png
						exit 0
					else
						##  SINGLE PRINT ONLY WITH REGULAR EXT
						ffmpeg -i "$FINALIN" -y  -ss 00:00:01:00 -f  image2 -vframes 1 "$PREFILE.$EXTREG.png"  < /dev/null
						covert "$PREFILE.$EXTREG.png" -resize 256x256\! "thumbs/$PREFILE.$EXTREG.png"
						rm *.png
						exit 0
				fi
		#ffmpeg -i "$INPUT" -y -ss 00:00:10.435 -f image2 -vframes 1 INPUT.dat < /dev/null
		#convert INPUT.dat -resize 256x256\> "thumbs/$INPUT.png" < /dev/null
		#rm INPUT.dat
		#exit 0
	fi
#ffmpeg -i "$INPUT" -y -ss 00:00:10.435 -f image2 -vframes 1 INPUT.dat < /dev/null
#convert INPUT.dat -resize 256x256\> "$FILEEXTENOUT" < /dev/null
#rm INPUT.dat
exit 0
