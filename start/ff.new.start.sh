#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


$SUDO sed -i -e '/UUID/d' /etc/fstab
NUMB="0 1"
dCODE=( `blkid | grep 'ext4' | cut -d'"' -f2 ` )
CODES=`cat /etc/fstab | grep ext4 | awk '{$1=""; $2=""; $5="";$6=""; print $0}' `
for m in "${dCODE[@]}"; do
	$SUDO sh -c "echo \"UUID=$m $CODES $NUMB\" >> /etc/stab"
	NUMB="0 0"
done
SCODES=( `blkid | grep 'swap' | cut -d'"' -f2 ` )
sCODES=`cat /etc/fstab | grep swap | awk '{$1=""; $2=""; print $0}' | sed 's/1//g' | sed 's/0//g'`
for o in "${SCODES[@]}"; do
	$SUDO sh -c "echo \"UUID=$o $sCODES $NUMB\" >> /etc/stab"
done
echo "${_ok} /etc/fstab configured"

 $SUDO systemctl disable apparmor
 $SUDO systemctl enable apache2
 $SUDO mysql_secure_installation
 rm $PWD/ff.new.start.sh 2> /dev/null
 source /usr/local/bin/ff.apt.update
# $SUDO reboot
#echo "${_warn} rebooting"

exit 0
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.new.start.sh  [ACTIVE] y

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.new.start.sh  [ACTIVE] y

