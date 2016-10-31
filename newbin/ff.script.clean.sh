#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
FILEGET=$( IFS= find $1 -exec basename {} \; )
FILENAME=$( printf "$FILEGET" | sed 's/lab./ff./' )
less $FILEGET | sed '/#/d' | sed '/^$/d' > $FILENAME
echo "$FILEGET finalized as $FILENAME"
ff.script.kill $FILEGET
chmod +x $FILENAME

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.clean.sh  [ACTIVE] y

