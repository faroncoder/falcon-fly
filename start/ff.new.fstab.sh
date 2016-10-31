#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
PATH="/"
$SUDO /bin/sed -i -e '/UUID/d' /etc/fstab
NUMB="0 1"
UUIDS=( `/sbin/blkid | /bin/grep 'ext4' | /usr/bin/cut -d'"' -f2 ` )
for m in "${UUIDS[@]}"; do
	CODES="$PATH ext4 errors=remount-ro $NUMB"
	LINEFS="UUID=$m $CODES"
	#$SUDO sh -c echo $LINEFS >> /etc/fstab
	/bin/echo $LINEFS
	NUMB="0 0"
	PATH="/home"
done
CODE=( `/sbin/blkid | /bin/grep 'swap' | /usr/bin/cut -d'"' -f2 ` )

for o in "${CODE[@]}"; do
	sCODES="none swap sw   0 0"
	YUDI="UUID=$o $sCODES"
	/bin/echo $YUDI
	#$SUDO sh -c echo $YUDI >> /etc/fstab
done
/bin/echo "$Fok /etc/fstab configured"

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.new.fstab.sh  [ACTIVE] y

