#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
for d in *; do echo $d; done | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq .
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.json.listdirectory.sh  [ACTIVE] y

