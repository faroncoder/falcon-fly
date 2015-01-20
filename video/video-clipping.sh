#!/bin/bash
CLIPNAME="$1"
STARTTIME="$2"
ENDTIME="$3"
NEWNAME="$( uuid | cut -d '-' -f1-2 )"

function getmovietimeend {

GETRAWTIME="$( mediainfo "$CLIPNAME" | awk '{ if ( $1 =="Duration" ) {print $0; exit; }}' )"
POSHOUR="$( echo $GETRAWTIME | awk '{ print $3 }' )"
POSMIN="$( echo $GETRAWTIME | awk '{ print $4 }' )"
POSSEC="$( echo $GETRAWTIME | awk '{ print $5 }' )"
POSSM="$( echo $GETRAWTIME | awk '{ print $5 }' )"

CHECKFORMAT="$( echo "${POSHOUR: -1}" )"

if [ "$CHECKFORMAT" = "h" ]
    then


        PLHOUR="$( echo $POSHOUR | tr 'h' ' '| tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' ' )"
        PLMINUTE="$( echo $POSMIN | tr 'h' ' '| tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' ' )"
        PLSECOND="$( echo $POSSEC | tr 'h' ' '| tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' '  )"
        PLSECMM="$( echo $POSSM | tr 'h' ' ' | tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' '  )"
      CALENDTIME="$( echo "$PLHOUR:$PLMINUTE:$PLSECOND" | sed 's/ //g' )"
fi
if [ "$CHECKFORMAT" = "n" ]
    then

        PLHOUR="$( echo 00 )"
        PLMINUTE="$( echo $POSHOUR | tr 'mn' ' ' )"
        PLMINUTE="$( printf '%02i\n' $PLMINUTE )"
        PLSECOND="$( echo $POSMIN | tr 's' ' '  )"
        PLSECOND="$( printf '%02i\n' $PLSECOND )"
        PLSECMM="$( echo $POSSEC | tr 'ms' ' '  )"
        PLSECMM="$( printf '%02i\n' $PLSECMM )"
        CALENDTIME="$( echo "$PLHOUR:$PLMINUTE:$PLSECOND" | sed 's/ //g' )"
  fi
if [ "$CHECKFORMAT" = "s" ]
    then

        PLHOUR="$( echo 00 )"
        PLMINUTE="$( echo 00 )"
        PLSECOND="$( echo $POSHOUR | tr 'h' ' '| tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' ' )"
        PLSECOND="$( printf '%02i\n' $PLSECOND )"
        PLSECMM="$( echo $POSMIN | tr 'h' ' '| tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' '  )"
        PLSECMM="$( printf '%02i\n' $PLSECMM )"
      CALENDTIME="$( echo "$PLHOUR:$PLMINUTE:$PLSECOND" | sed 's/ //g' )"
  fi
if [ "$CHECKFORMAT" = "ms" ]
    then

        PLHOUR="$( echo 00 )"
        PLMINUTE="$( echo 00 )"
        PLSECOND="$( echo 00 )"
        PLSECMM="$( echo $POSHOUR | tr 'h' ' '| tr 'mn' ' '| tr 's' ' ' | tr 'ms' ' ' )"
        PLSECMM="$( printf '%02i\n' $PLSECMM )"
        CALENDTIME="$( echo "$PLHOUR:$PLMINUTE:$PLSECOND" | sed 's/ //g' )"

fi

## returns time as CALENDTIME

}

STARTTIME="00:00:00"

if [ ! -d "../clips" ]
	then
		mkdir ../clips
		ln -s ../clips clips
fi

if [ ! -d "../clips-completed" ]
	then
		mkdir ../clips-completed
		ln -s ../clips-completed clips-completed
fi


if [ -z "$1" ]
    then
    echo -n "Which clip you want to check? "
    read CLIPNAME
fi

if [ -z "$2" ]
    then
    echo -n "Extract clip at starting time? [Enter if 00:00:00] "
    read GETSTARTTIME
    if [ -z "$GETSTARTTIME"  ]
        then
            GETSTARTTIME="00:00:00"
    fi
fi

if [ -z "$3" ]
    then
    getmovietimeend
    echo -n "Extract clip at ending time? [Enter for $CALENDTIME] "
    read GETENDTIME
    if [ -z "$GETENDTIME"  ]
        then
            GETENDTIME=$CALENDTIME
    fi
fi

ENDTIME="$( echo $GETENDTIME | sed 's/\./:/g' )"
STARTTIME="$( echo $GETSTARTTIME | sed 's/\./:/g' )"

ffmpeg -ss "$STARTTIME" -i "$CLIPNAME" -to "$ENDTIME" -c copy -pix_fmt yuv420p -map 0 -reset_timestamps 1 -fflags genpts -movflags +faststart -f mp4 "clips/$NEWNAME.mp4" < /dev/null

echo -n "push $CLIPNAME out as completed? "
read PUSHRESPOND
if [ "$PUSHRESPOND" = "y" ]
    then
        mv $CLIPNAME clips-completed/
        echo "$CLIPNAME archieved as processed..."
    else
        echo "$CLIPNAME still resides in this directory..."
fi

exit 0
