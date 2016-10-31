#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors;  source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


CT=0
while read line; do
  CT=`echo $(( $CT + 1 ))`
  #export CH$CT=$line
  	$line
done < /usr/local/lib/faron_falcon/characters
echo "$Fok $CT exported"


# CT=0; while read line; do CT=`echo $(( $CT + 1 ))`;
# export CHR$CT=$line;
# done  source /usr/local/lib/faron_falcon/characters

# CT=0;
# while read line; do
# 	CT=`echo $(( $CT + 1 ))`
# 	export CH$CT=$line
# done  source /usr/local/lib/faron_falcon/characters
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
#      done  source /usr/local/lib/faron_falcon/characters
# echo "";

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.characters-export.sh  [ACTIVE] y
