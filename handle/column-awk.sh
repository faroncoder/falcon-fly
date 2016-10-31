#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

{
    width=25;
    separator=" ";

    for (i=1; i<=NF; i++) {
        if (match($i, /[-+]*[0-9]+[\.]*[0-9]*/)) {
            printf("%"width"s", $i);
        }
        else {
            printf("%-"width"s", $i);
        }
        if (i == NF) printf("\n");
        else printf("%s", separator);
    }
}


#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] column-awk.sh  [ACTIVE] y

