#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

CT=0
 while read line; do
        CT=`echo $(( $CT + 1 ))`
        LINE=`echo $line | cut -d'=' -f1`
        ME=`echo $LINE | sed 's/CHR//g'`
        MEF="echo -n "
    if [[ "$NE" == 5 ]]; then
        MEF="echo"
        NE=0
    fi
        $MEF "$Fteal[$CT]$Foff$( echo $LINE )"
        NE=`echo $(( $NE + 1))`
     done < /usr/local/lib/faron_falcon/characters
echo ""

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.characters-ls.sh  [ACTIVE] y

