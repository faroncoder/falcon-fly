#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#################### BEGIN

 num=$1
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
     day=`seq -w 00 $day | tail -n 1`
     hour=`seq -w 00 $hour | tail -n 1`
     min=`seq -w 00 $min | tail -n 1`
     sec=`seq -w 00 $sec | tail -n 1`
    echo "$day:$hour:$min:$sec"

################### END
XeF  ### exit code for clean exit
### [FILE:ff.script.new ACTIVE:y
