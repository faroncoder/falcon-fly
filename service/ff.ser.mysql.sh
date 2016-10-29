#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
if [[ "$1" != "" ]]; then
#################### BEGIN

$SUDO service apache2 restart

# echo -e "$Fstat"
# echo -e "$Fno"
# echo -e "$Fwarn"
echo -e "$Finfo mysql service restarted"
# echo -e "$Fok"



################### END
#cd $RETURN 1> /dev/null;
else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


