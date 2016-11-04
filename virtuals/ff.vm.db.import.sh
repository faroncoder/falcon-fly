#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
#!/bin/sh

SQLROOTPW=""

if [ "$1" != '' ]; then
  DB=`echo "$1" | sed 's/.sql//g'`
  mysql -uroot -p$SQLROOTPW $DB < $1
  echo "imported database."
elif [ "$1" = 'help' ] || [ "$1" = '' ]; then
  echo "usage:"
  echo "importdb "
  echo "example: to import a database just run the command 'importdb mywebsite.sql' where 'mywebsite' is the name of the database to import into"
fi


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vm.db.import.sh  [ACTIVE] y

