#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

if [[ "$1" == "" ]]; then
	echo -n "$Finfo script name? "
	read CL
fi
if [[ "$2" == "" ]]; then
	echo -n "$Finfo folder? "
	read xcs
fi
CL=$1
xcs=$2
arumentsInstall(){
echo -n "$Finfo Script response when no arguments is entered?  "
		read Descript
		LOADDes="$Descript"
		INTERACT="if [[ \"\$1\" != \"\" ]]; then"
		ENDINTERACT="else echo \"\$Fno \$Fred no argument is supplied.\$Foff\""
#################### BEGIN
"
FOOTER="################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.new.sh  [ACTIVE] y

