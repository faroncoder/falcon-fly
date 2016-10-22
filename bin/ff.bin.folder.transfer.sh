#!/bin/bash
LOCH="$1"
if [ -z "$LOCH" ]
	then
		echo -n "which directory? (full path)?  "
		read LOCH
fi
LOCHA="$( basename `echo $LOCH` )"

#if [ ! -d "/home/$USER/$LOCHA" ]
#        then
#                mkdir -p "/home/$USER/$LOCHA"
#fi
#if [ ! -d "$PWD/$LOCHA" ]
 #       then
 #               mkdir -p "$PWD/$LOCHA"
#fi

mv "$LOCH" "/home/$USER/"
exit 0
