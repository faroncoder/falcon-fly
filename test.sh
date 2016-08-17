#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LOC=/usr/local/lib/faron_falcon; . $LOC/colors; . $LOC/functions;
#if [[ "$1" != "" ]]; then
#################### BEGIN


echo -e $Fok"$Fyellow $( basename $0 ) $Foff"

################### END
#cd $RETURN 1> /dev/null;
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/bin/ff.script.new  [ACTIVE] y

