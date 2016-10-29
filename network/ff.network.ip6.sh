#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
#if [[ "$1" != "" ]]; then
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
#cd $RETURN 1> /dev/null;
#else echo -e "$Fstat $Fred Arg 1 $Foff=$Fyellow explain argments before calling. $Foff"; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /usr/local/bin/ff.script.new  [ACTIVE] y


