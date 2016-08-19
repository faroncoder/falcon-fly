#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN


$SUDO service apache2 restart

<<<<<<< HEAD
echo -e "$Finfo apache2 service restarted"
=======
# echo -e "$Fstat"
# echo -e "$Fno"
# echo -e "$Fwarn"
echo -e "$Finfo apache2 service restarted"
# echo -e "$Fok"
>>>>>>> 29e4183d3b6d1850a4ea2847270ca4df3c22fcf8


################### END
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] $0  [ACTIVE] y


