#!/bin/bash

FILE="$1"
SIZE="$2"
FILT="$3"

if [[ "$SIZE" > "$FILT" ]]; then
	echo "$FILE needs to be downsized"

else
	echo  "$FILE looks good"
fi



exit 0
