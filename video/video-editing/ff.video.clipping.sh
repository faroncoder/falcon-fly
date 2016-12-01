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
        if [[ ! -f "$PWD/orig-$FILENAME" ]]; then
                    cp $FILENAME "orig-$FILENAME"
        fi
        CLIPNAME="$FILENAME"
        if [[ "$GETSTTIME" == "" ]]; then
            echo -n "Begin time of clip? ( format: 00:00:00 ) "
            read GETSTTIME
        fi
        if [[ "$GETENDTIME" == "" ]]; then
            echo -n "End time of clip?  ( $REELTIMEEND ) "
            read GETENDTIME
       fi

STARTTIME=`echo $GETSTTIME | tr '.' ':'`
ENDTIME=`echo $GETENDTIME | tr '.' ':'`
    

    # timeA=$STARTTIME # 09:59:35
    # timeB=$ENDTIME # 17:32:55

    # feeding variables by using read and splitting with IFS
    IFS=: read ah am as <<< "$STARTTIME"
    IFS=: read bh bm bs <<< "$ENDTIME"

    # Convert hours to minutes.
    # The 10# is there to avoid errors with leading zeros
    # by telling bash that we use base 10
    secondsA=`echo "( $ah * 60 * 60 ) + ( $am * 60 ) + ( $as )" | bc `
    secondsB=`echo "( $bh * 60 * 60 ) + ( $bm * 60 ) + ( $bs )" | bc `
    
    # echo $((10#$ah*60*60 + 10#$am*60 + 10#$as))
    # secondsB=echo $((10#$bh*60*60 + 10#$bm*60 + 10#$bs))
    DIFF_SEC=`echo "$secondsB -  $secondsA" | bc `
    # echo "The difference is $DIFF_SEC seconds.";

    SEC=$(($DIFF_SEC%60))
    MIN=$((($DIFF_SEC-$SEC)%3600/60))
    HRS=$((($DIFF_SEC-$MIN*60)/3600))
   
    SEC=`seq -w 00 $SEC | tail -n 1`
    MIN=`seq -w 00 $MIN | tail -n 1`
    HRS=`seq -w 00 $HRS | tail -n 1`
    TIME_DIFF="$HRS:$MIN:$SEC";
    TIMEWHERE=$TIME_DIFF

    echo $TIMEWHERE
#        NEWCLIPNAME="clipped-`uuid`-$CLIPNAME"
#      # echo "$STARTTIME for $TOTAL seconds on $CLIPNAME"
#      # echo $TIMEWHERE
 EXT=`echo $CLIPNAME | rev | cut -d'.' -f1 | rev`

  
    TEMP=`uuid`
    TEMPFILE="$TEMP.$EXT"

       ffmpeg   -ss "$STARTTIME" -i "$CLIPNAME" -t "$TIMEWHERE" -c copy -metadata comment="clipped from orginial" -f "$EXT" "$TEMPFILE" < /dev/null
# # done    
# GETCLIPPED=( ` find . maxdepth 1 -type f -name 'clipped-*' ` )

            NEWCLIPNAME="`md5sum $TEMPFILE | awk '{print $1}'`"
            # POSTNAME="$NEWCLIPNAME.$EXT"
                # OLD=`echo $CLIPNAME | sed "s/.$EXT//g"`
            # echo "$OLD == $NEWCLIPNAME  | $CLIPNAME"

            # rename "s/$OLD/$NEW/g" $CLIPNAME
            rename "s/$TEMP/$NEWCLIPNAME-clipped/g" $TEMPFILE

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] video-clipping.sh  [ACTIVE] y

