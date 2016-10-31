#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
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


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.vm.db.import.sh  [ACTIVE] y

