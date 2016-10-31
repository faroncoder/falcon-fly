#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

OURIP=`ff.net.ip | head -n 1 | awk '{ print $6 }'`
IP6FETCH=`ff.network.ip6-loader`
/sbin/modprobe -q ipv6
ip tunnel add he-ipv6 mode sit remote 216.66.38.58 local $OURIP ttl 255
ip link set he-ipv6 up
ip addr add $IP6FETCH/64 dev he-ipv6
ip route add ::/0 dev he-ipv6
ip -f inet6 addr
ifconfig
echo "$Fok"


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.network.ip6.sh  [ACTIVE] y

