#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
FILENAME="$1"
GETSTTIME="$2"
GETENDTIME="$3"
# NEWNAME="$( uuid | cut -d '-' -f1-2 )"







# function getmovietimeend {

    mediainfo $FILENAME | grep 'Duration' | head -n 1 | cut -d':' -f2 > /tmp/time.txt
    sed -i -e 's/ /\n/g' /tmp/time.txt
    # echo $TIMEDONE | tr '  ' '\n' >> /tmp/time.txt
    # for time in "${TIMEDONE[@]}"; do
        sed -i -e '/ms/d' /tmp/time.txt
        HR=`grep 'h' /tmp/time.txt | sed 's/h//g'`
        MN=`grep 'mn' /tmp/time.txt | sed 's/[A-Za-z]//g'`
        SC=`grep 's' /tmp/time.txt | sed 's/[A-Za-z]//g' `
        > /tmp/time.txt        
        CHK=`echo $HR`
        if [[ "$CHK" == "" ]]; then
            HR="0"
        fi
        CHK=`echo $MN`
        if [[ "$CHK" == "" ]]; then
            MN="0"
        fi
        CHK=`echo $SC`
        if [[ "$CHK" == "" ]]; then
            SC="0"
        fi
        HR=`seq -w 00 $HR | tail -n 1`
        MN=`seq -w 00 $MN | tail -n 1`
        SC=`seq -w 00 $SC | tail -n 1`
        REELTIMEEND="$HR:$MN:$SC"   
        REELIDTIME="$HR h $MN m $SC s"
        REELLID=`echo $REELIDTIME  | sed 's/ //g'`     
## GET FILE extension
        EXT=`echo $FILENAME | rev | cut -d'.' -f1 | rev`
        FILEI=`echo $FILENAME  | sed "s/.$EXT//g"`
        FILEID=`echo ${FILEI:0:6}`
        if [[ "$( echo $FILENAME  | grep 'original' )" == "" ]]; then 
        
        TRANSFER="$FILEID-original-$FILEI-$REELLID.$EXT"
        
        if [[ ! -f "$TRANSFER" ]]; then 
                mv $FILENAME $TRANSFER
                CLIPNAME=$TRANSFER
        fi
    else
        CLIPNAME=$FILENAME
fi
        if [[ "$GETSTTIME" == "" ]]; then
            echo -n "Begin time of clip? ( format: 00:00:00 ) "
            read GETSTTIME
        fi
        if [[ "$GETENDTIME" == "" ]]; then
            echo -n "End time of clip?  ( $REELTIMEEND ) "
            read GETENDTIME
       fi


### convert input "." to ":" ( use "." for quick keying duration time as an argument, instead of ":")
### this convert the input into a proper format for ffmpeg command ( 00:00:00 )
STARTTIME=`echo $GETSTTIME | tr '.' ':'`
ENDTIME=`echo $GETENDTIME | tr '.' ':'`


TRME=`echo $GETSTTIME | tr '.' '  '`
TRME=`echo $TRME |  tr ':' '  '`
TRH=`echo $TRME | awk '{ print $1}'`
TRM=`echo $TRME |  awk '{ print $2}'`
TRS=`echo $TRME |  awk '{ print $3}'`
TIMEB=`echo "$TRH h $TRM m $TRS s"`
TIMEF=`echo $TIMEB | sed 's/ //g'`




BFME=`echo $GETENDTIME | tr '.' '  '`
BFME=`echo $BFME |  tr ':' '  '`
BFH=`echo $BFME | awk '{ print $1}'`
BFM=`echo $BFME |  awk '{ print $2}'`
BFS=`echo $BFME |  awk '{ print $3}'`
TIMEC=`echo "$BFH h $BFM m $BFS s"`
TIMED=`echo $TIMEC | sed 's/ //g'`



TIMEPLOT="$TIMEF-to-$TIMED"

### COUNT any clippings from FILENAME as entered
GETNUM=`find $PWD -maxdepth 1 -type f -name "*$CLIPNAME*" | wc -l `
COUNT=`echo "$GETNUM + 1" | bc `

    # timeA=$STARTTIME # 09:59:35
    # timeB=$ENDTIME # 17:32:55

## reading inputs into formatted response for next function
    # feeding variables by using read and splitting with IFS
    IFS=: read ah am as <<< "$STARTTIME"
    IFS=: read bh bm bs <<< "$ENDTIME"

    # Convert hours to minutes.
    secondsA=`echo "( $ah * 60 * 60 ) + ( $am * 60 ) + ( $as )" | bc `
    secondsB=`echo "( $bh * 60 * 60 ) + ( $bm * 60 ) + ( $bs )" | bc `
    
    # echo $((10#$ah*60*60 + 10#$am*60 + 10#$as))
    # secondsB=echo $((10#$bh*60*60 + 10#$bm*60 + 10#$bs))
    DIFF_SEC=`echo "$secondsB -  $secondsA" | bc `

    # echo "The difference is $DIFF_SEC seconds.";


    ## This is to calcuate the specfic duration between start time and end time for ffmpeg 
    SEC=$(($DIFF_SEC%60))
    MIN=$((($DIFF_SEC-$SEC)%3600/60))
    HRS=$((($DIFF_SEC-$MIN*60)/3600))
   
    SEC=`seq -w 00 $SEC | tail -n 1`
    MIN=`seq -w 00 $MIN | tail -n 1`
    HRS=`seq -w 00 $HRS | tail -n 1`
    TIME_DIFF="$HRS:$MIN:$SEC";
    TIMEWHERE=$TIME_DIFF

#        NEWCLIPNAME="clipped-`uuid`-$CLIPNAME"
#      # echo "$STARTTIME for $TOTAL seconds on $CLIPNAME"
#      # echo $TIMEWHERE


  ## generating new temp name
    TEMP=`uuid`
 ## assigned temp name after extracting file extension (from recent step)
    TEMPFILE="$TEMP.$EXT"
### grab file batch assign ID for grouped clippings
    FILEID=`echo ${FILEI:0:6}`
### counts how many clippings already made from the file 
FCOUNT=`find -maxdepth 1 -type f -name "$FILEID-*"  | wc -l `
### begin ffmpeg to clip
       ffmpeg   -ss "$STARTTIME" -i "$CLIPNAME" -t "$TIMEWHERE" -c copy -metadata comment="clipped from orginial" -f "$EXT" "$TEMPFILE" < /dev/null
# # done    

#generate MD5sum for this new clipping so that way it'll eliminate any possible duplications

            NEWCLIPNAME="`md5sum $TEMPFILE | awk '{print $1}'`"

# rename ceremony 
MOI=`echo "$FILEID-$NEWCLIPNAME-$FCOUNT-$TIMEPLOT-clipped" | sed 's/ //g'`

   rename "s/$TEMP/$MOI/g" $TEMPFILE

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] video-clipping.sh  [ACTIVE] y

