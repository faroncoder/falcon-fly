#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##
J="nameserver "; K="162.220"; L="64.68.198";
$SUDO sh -c "echo  \"$J $L.91\n$J $L.183\n$J $L.83\n$J 166.88.18.58\n$J $K.33.236\n$J $K.34.74\n\" > /etc/resolvconf/resolv.conf.d/head"
cat /etc/resolvconf/resolv.conf.d/head
echo -e ${_ok}
#echo -e "${_ok}$Fyellow $( basename $0 ) $Foff"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.resolv.sh  [ACTIVE] y

