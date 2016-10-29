#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
if [[ "$1" != "" ]]; then
#################### BEGIN

echo "$Fstat"
echo "$Fno"
echo "$Fwarn"
echo "$Finfo"
echo "$Fok"


################### END
else echo "$Fno $Fred Arg 1 $Foff=$Fyellow filename as 1st argumenet $Foff"; fi
################### END
XeF  ### exit code for clean exit
### [FILE:ff.script.new ACTIVE:y
