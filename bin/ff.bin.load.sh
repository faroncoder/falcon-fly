#!/bin/bash
FILO="$1"
FIL="`basename $FILO`"
FILEM="`echo $FIL | sed 's/.sh//g' `"
rm "/home/faron/.bin/$FILEM" -f
rm "/home/faron/.bin/$FILEM.sh" -f
ln -s "$PWD/$FIL" "/home/faron/.bin/$FILEM"
echo "FALCON: Symlink created for $FIL"
exit 0
