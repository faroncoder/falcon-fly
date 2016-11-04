#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
echo "\$.getScript(\"./jsc/jsc/$line\", function(data, textStatus) { " > script.dat
echo "       console.log(\"\BASHFILENAME loaded\", textStatus); " >> script.dat
echo "    });" >> script.dat
echo "generated a js block for 'appengine.js'"
echo ""


####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] appengine-generator.sh  [ACTIVE] y

