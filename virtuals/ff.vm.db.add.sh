#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

SQLUSER=""
SQLROOTPW=""

if [ "$1" != '' ]; then
  echo "CREATE DATABASE $1" | mysql -uroot -p$SQLROOTPW
  echo "GRANT ALL ON $1.* TO '$SQLUSER'@'localhost'" | mysql -uroot -p$SQLROOTPW
  echo "flush privileges" | mysql -uroot -p$SQLROOTPW
  echo "added database."
elif [ "$1" = 'help' ] || [ "$1" = '' ]; then
  echo "usage:"
  echo "sudo adddb "
  echo "example: to create a new database just run the command 'sudo adddb mywebsite'"
fi


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vm.db.add.sh  [ACTIVE] y

