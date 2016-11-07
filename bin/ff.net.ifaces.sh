#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## b_red Fblack b_green b_yellow b_blue b_purple b_teal Fwhite reset ##

$SUDO ifconfig enp1s5 0.0.0.0
$SUDO ifconfig enp1s5:1 10.0.0.10/8
$SUDO ifconfig enp1s5:1 10.74.11.1/8

#ifconfig

route -n

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ifaces.sh  [ACTIVE] y

