#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
ff.apt.fetch apache2-dev
cd /tmp
wget http://people.apache.org/~pquerna/modules/mod_flvx.c
sudo apxs -i -a -c mod_flvx.c 
ff.apache2.restart

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] install_apache_mod_flv.sh  [ACTIVE] y

