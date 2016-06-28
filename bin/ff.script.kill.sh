#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  loadSudo;
RETURN=$PWD;
if [[ "$1" != "" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##

arbin="/mnt/falcon/archives/kills"
echo -e "$Finfo Killing $1 $Foff"
GETNA="$( uuid | cut -d'-' -f5 )"
mv "$PWD/$1" "$arbin/$GETNA-$1"
echo -e "$Fok $1 killed"

################### END
#cd $RETURN 1> /dev/null
else echo -e "$Fwarn Arg 1:$Fyellow script to kill $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

