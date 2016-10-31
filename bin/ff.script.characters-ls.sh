#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LBF="/usr/local/lib/faron_falcon"; . $LBF/colors; source /usr/local/lib/faron_falcon/functions;
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
cd  $RETURN 1> /dev/null 2> /dev/null;
XeF  ### exit code for clean exit
### [ FILE:$MEF ACTIVE:y ]
