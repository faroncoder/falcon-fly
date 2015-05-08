#!/bin/bash

THISFILE=$( cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1  )

nohup $( firewire-recording $THISFILE ) & sleep 3; ffplay "$THISFILE.mpg";
exit 0


