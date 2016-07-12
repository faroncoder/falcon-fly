#!/bin/bash

GI=`basename $1`
GIF="$PWD/$GI"
jj=$( uuid );
ji=`printf $jj | cut -d '-' -f 4`
mv $PWD/$1 /mnt/falcon/scripts/kills/$jj-$GI
#mv "$XD/$XF" "$XD/old-$ji-$XF";
echo -e "$Fstat $1 killed."



exit 0

