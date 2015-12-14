#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` )
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
	exit 0
}
#### IGNORE ABOVE
export PATH=$PATH
PATHDIR="$PWD"
MASTERPATH=$( dirname $PATHDIR )
BASELOC=$( basename $PATHDIR )
SERVER=$( hostname --short )
cd $PATHDIR
INPUT="$( basename $1 )"
PREFILE=$( rev <<< $INPUT | cut -d"." -f2 | rev )
EFXI=$( rev <<< $INPUT | cut -d"." -f1 | rev )
## only have one option for now which is libx264. future development will add few more libraries to the choice such as libraries for webm, flv, etc.
CODECVID="libx264"
## 1 = ultrafast | 2 = fast | 3 = medium | 4 = veryslow
PRESET="3"
## YES = 1 | NO = NULL
FORCINGHIGHPROFILE=""
CRF="25"
## Video resolution.  360 for 360p; 480 for 480p; 720 for 720p, etc
HEIGHTWT="480"
## This provokes the VBV method in ffmpeg
## BEGING of VBV
MAXRAT="1200k"
BUFRAT="900k"
BITRAT="900k"
## END OF VBV
## Let's define variables for ffmpeg
TITLEFILE=" "
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""



function ffmpegengine() {
	## Let's meet pre-requestions before firing ffmpeg.  Let's identify which server we are residenting in:
#	if [[ "$( `hostname --short` )" == "f10" ]]; then
                    ## if this host is server A, let use this library
                    CODECAID="libmp3lame"
#            else
            		## If this host is not Server A, we'll use different library.
#                    CODECAID="libvo_aacenc"
 #   fi
    if [[ "$CODECVID" == "libx264" ]]; then
    		COND1="-tune zerolatency -qp 0"
    		## Defining our codes for libx264
        	if [[ "$PRESET" == "1" ]]; then
					PRESETx264="ultrafast $COND1"
        	fi
	        if [[ "$PRESET" == "2" ]]; then
					PRESETx264="fast"
	        fi
	        if [[ "$PRESET" == "3" ]]; then
					PRESETx264="medium"
	        fi
	        if [[ "$PRESET" == "4" ]]; then
					PRESETx264="veryslow $COND1"
	        fi
	        ## Triggering a flag whether to use -profile high or not
	        if [[ -z "$FORCINGHIGHPROFILE" ]] || [[ ! "$FORCINGHIGHPROFILE" ]]; then
	        			FORCEPROFILE=""
	        	else
	        			FORCEPROFILE="-profile high"
	        fi
	        CODECVCOMMANDS=" -vcodec $CODECVID -preset $PRESETx264 -crf $CRF $FORCEPROFILE"
	        FILETYPE="mp4"
	fi
	COMMENTFILE="Falcon $( date ) - $0"
	#echo "y" | /usr/bin/avidemux2_cli --load $INPUT --output-format MATROSKA --save "`basename $INPUT | cut -d"." -f1`_converted_mkv.mkv" --quit
	#mkdir $PWD/lib_mp4



cp "$PWD/$INPUT" "$HOME/$INPUT"
mv "$INPUT" "hold/$( hostname --short )_$INPUT"
cd $HOME

	ffmpeg -fflags genpts -ss 00:00:00 -i $INPUT -y -ss 00:00:00 $CODECVCOMMANDS \
		-maxrate $MAXRAT -bufsize $BUFRAT -b:v $BITRAT \
		-coder 1 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 \
		-me_method hex -subq 6 -me_range 16 -keyint_min 25 -sc_threshold 40 \
		-i_qfactor 0.71 -b_strategy 1 \
		-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		-flags +loop -flags +global_header -movflags +faststart  \
		-pix_fmt +yuv420p -g 60 -acodec "$CODECAID" -b:a 128k -ar 44100 -ac 2 \
		-metadata title="$TITLEFILE" \
		-metadata album="$ALBUMFILE" \
		-metadata year="$YEARFILE" \
		-metadata container="$CONTAINTERFILE" \
		-metadata artist="$ARTISTFILE" \
		-metadata comment="$COMMENTFILE" \
		-f mp4 "$( hostname --short )_$( echo $INPUT | sed 's/.mkv/.mp4/g' )"
		mv "$( hostname --short )_$( echo $INPUT | sed 's/.mkv/.mp4/g' )" "$PATHDIR/mp4/$( echo $INPUT | sed 's/.mkv/.mp4/g' )"
		rm $INPUT
		cd $PATHDIR
		mv "hold/$( hostname --short)_$INPUT" "done/$INPUT"


#"`basename $INPUT | cut -d"." -f1`.$FILETYPE"
#		rename 's/_mastercopy/_copy/g' "`basename $INPUT | cut -d"." -f1`.$FILETYPE"
		#lets md5sum the file
		#md5sum "$PREFILE.$FILETYPE" > "$PREFILE.dat"
		#Lets clean up - sending input file to 'completed' folder

		#mkdir $PWD/completed -p
		#mv $INPUT "`basename $INPUT | cut -d"." -f1`_orig_but_discard_me.`basename $INPUT | rev | cut -d"." -f1 | rev`"

		#rev <<< $INPUT | cut -d"." -f2 | rev
		## Sending new processed file to 'output' folder
		#mkdir $PWD/output -p
		#mv "$PREFILE.*" $PWD/output/
}

## Let's see if we have file to process by command 'find'

# if [[ ! -z "$1" ]]; then
# 	INPUT="$1"
# else
# 	INPUT=$( find "$PATHDIR" -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )
# fi

## Supposedly INPUT returns as true (found a file)
if [[ ! -z "$INPUT" ]]; then

		## we grab filename of the file without extension
        #PREFILE="$( rev <<< $INPUT | cut -d"." -f2 | rev )"
        ## start ffmpeg function
        ffmpegengine
    ## if INPUT returns as false ( found a file )
    else
    	## Let's double check if we actually do not have file to process to be safe than sorry (via sort/find/extracting filename from file )
    	if [[ -z "$PREFILE" ]]; then
		## if there is no filename, then we are satisfied and exit via logger.
		stopwatchtime
    	fi
fi

#ffmpeg -ss 00:00:10.435 -i "output/$PREFILE.mp4" -y -f  image2 -vframes 1 "$PREFILE.png"  < /dev/null
#convert "$PREFILE.png" -resize "330x248^" -gravity center -background black -extent 330x248 "thumbs/$INPUT.png" < /dev/null
#convert "$PREFILE.png" -resize 256x256\> "thumbs/$PREFILE.png"
#rm "$PREFILE.png"
#ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"


## script self-executes so it'd loop to finish all of files.
#$0
stopwatchtime
### Faron's note:  I didn't use loop via array for this one. FFMPEG does take time to finish processing one file at a rate of movie's length time which it'll stands as an ETA for FMPEG to finish processing.  I.e. if mkv has a movie stream and its movie time is 1hr and 30min; therefore ETA for FFMPEG to finish would be 1hr and 30min (more or less) [ x264 is huge reason ].  So, if I did use array method to loop / process files, when I break the code via CTRL-C, script will stop processing the file, but it'll still move on to next movie to process.  It'll have to be stopped via CTRL-Z.  I prefer using CTRL-C in order to be able to track for various reasons however CTRL-Z only kill the script but leaving with no footprints - thus harder for me to track (and it opens the door for bugs).  This method simply process the file at a time, and will exit but, also self-execute so, it'd loop to next file leaving footprints which are trackable.