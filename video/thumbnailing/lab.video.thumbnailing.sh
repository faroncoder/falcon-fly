#!/bin/bash
startgreen=`date +%s`

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
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
					else

						find . -maxdepth 1 -type f -exec ffmpegthumbnailer -i {} -o "{}.png" -s 0 \;  -exec convert -resize 340x256^ "{}.png"  "{}x.png" \; -exec convert -crop 341x256+0+0 "{}x.png" "thumbs/{}.png" \; -exec rm "*.png" \;
						#find . -maxdepth 1 -type f -exec ffmpeg  -ss 00:60:00.00 -i {} -y  -f  image2 -vframes 1 "{}.png"  < /dev/null
						rename 's/$EXTREG//g' "*.png"
						#find . -maxdepth 1 -type f -name '*.png' -exec convert -resize 340x256^  {} "thumbs/{}" \; -exec rm {} \;
						#rm *.png
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
				fi

	else

		ffmpegthumbnailer -i "$INPUT" -o "$INPUT.png" -s 0 \;
		convert -resize 340x256^ "$INPUT.png"  "x.png"
		convert -crop 341x256+0+341 "x.png" "thumbs/$INPUT.png"
		rm *.png
		#ffmpeg -i "$INPUT" -y  -f  image2 -vframes 1   < /dev/null
		#convert -resize 340x256^ "$INPUT.png" "thumbs/$INPUT.png"
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
				fi
	else

					else
						##  SINGLE PRINT ONLY WITH REGULAR EXT
						ffmpegthumbnailer -i "$FINALIN" -o "x.png" -s 0 \;
						convert -resize 340x256^ "x.png"  "z.png"
						convert -crop 341x256+0+341 "z.png" "thumbs/$PREFILE.$EXTREG.png"
						rm *.png
						#ffmpeg -ss 00:60:00.00  -i "$FINALIN" -y  -f  image2 -vframes 1 "$PREFILE.$EXTREG.png"  < /dev/null
						#convert -resize 340x256^ "$PREFILE.$EXTREG.png" "$PWD/thumbs/$PREFILE.$EXTREG.png"
""
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8



fi
.
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
						find . -maxdepth 1 -type f -exec ffmpegthumbnailer -i {} -o "{}x.png" -s 0 \;  -exec convert -resize 340x256^ "{}x.png"  "{}z.png" \; -exec convert -crop 341x256+0+0 "{}z.png" "thumbs/{}.png" \; -exec rm "*.png" \;
						rename 's/$EXTREG//g' *.png
						find . -maxdepth 1 -type f -name '*.png' -exec convert -resize 340x256^ {} "{}" \;
						##rm *.png
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
					else
						##  SINGLE PRINT ONLY WITH REGULAR EXT
						ffmpegthumbnailer -i "$FINALIN" -o "x.png" -s 0 \;
						convert -resize 340x256^ x.png z.png
						convert -crop 341x256+0+341 z.png "$PREFILE.$EXTREG.png"
						#ffmpeg  -ss 00:60:00.00  -i "$FINALIN" -y  -f  image2 -vframes 1 "$PREFILE.$EXTREG.png"  < /dev/null
						#convert -resize 340x256^ "$PREFILE.$EXTREG.png"  "$PWD/$PREFILE.$EXTREG.png"
						##rm *.png
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
				fi
		#ffmpeg -i "$INPUT" -y -ss 00:00:10.435 -f image2 -vframes 1 INPUT.dat < /dev/null
		#convert INPUT.dat -resize 256x256\> "thumbs/$INPUT.png" < /dev/null
		#rm INPUT.dat
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	fi
#ffmpeg -i "$INPUT" -y -ss 00:00:10.435 -f image2 -vframes 1 INPUT.dat < /dev/null
#convert INPUT.dat -resize 256x256\> "$FILEEXTENOUT" < /dev/null
#rm INPUT.dat
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
