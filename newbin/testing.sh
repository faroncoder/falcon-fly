
#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors
source /usr/local/lib/faron_falcon/functions
if [[ "$1" != "" ]]; then
#################### BEGIN


$Fok $Fyellow echo -e "$( basename $0 ) $Foff"

################### END
#cd $RETURN
else $Finfo echo -e "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

