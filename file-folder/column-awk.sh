#!/bin/bash
startgreen=`date`

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


