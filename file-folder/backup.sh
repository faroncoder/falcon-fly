#!/bin/bash

SRVR=$( hostname -s )
cd /
sudo tar -cvpjf "$SRVR_backup.tar.gz" --exclude=/$SRVR_backup.tar.gz --one-file-system 

exit 0

