#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
GETPASS=$( ruby -e 'print "$1".crypt("JU"); print("\n");' )
echo $GETPASS >> /srv/www/access/.htpasswd
if [ ! $1 ]; then echo "passcode needed" exit 1 fi
if [ ! $2 ]; then echo "email needed" exit 2 fi
echo $GETPASS | mail -s 'New password: $1 generated at %{%H:%M:%S}d' $2
################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.user.password.sh  [ACTIVE] y

