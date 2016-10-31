#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################BEGIN

fucntion humanTime(){
 num=$RAW
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
     DAY=`seq -w 00 $day | tail -n 1 2> /dev/null `
      HOUR=`seq -w 00 $hour | tail -n 1 2> /dev/null `
      MIN=`seq -w 00 $min | tail -n 1 2> /dev/null `
      SEC=`seq -w 00 $sec | tail -n 1 2> /dev/null `
     echo "$DAY:$HOUR:$MIN:$SEC"
    sec=""; hour=""; min=""; sec="";
exit 0