#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN
CT=0; while read line; do CT=`echo $(( $CT + 1 ))`;
export CHR$CT=$line;
done < /usr/local/lib/faron_falcon/characters

# CT=0;
# while read line; do
# 	CT=`echo $(( $CT + 1 ))`
# 	export CH$CT=$line
# done < /usr/local/lib/faron_falcon/characters
# echo "$Fok"

# CT=0
#  while read line; do
#         CT=`echo $(( $CT + 1 ))`
#         #LINE=`echo $line | cut -d'=' -f1`
#         export CHR$CT=$line
#         MSG="yes"
#         echo "$FGmsg CHR$CT"
#        # $MEF "$Fteal[$CT]$Foff$( echo $LINE )"
#         NE=`echo $(( $NE + 1))`
#      done < /usr/local/lib/faron_falcon/characters
# echo "";

################### END
cd  $RETURN 1> /dev/null 2> /dev/null;
XeF  ### exit code for clean exit
### [ FILE:$MEF ACTIVE:y ]

