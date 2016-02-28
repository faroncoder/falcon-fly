#!/bin/bash

HERE=$PWD
cd "/usr/local/bin"
GETA=( `find /mnt/falcon/scripts -type f -name 'ff.*' `  )
 for j in "${GETA[@]}";  do
 	ln -s $j
 done
/usr/local/bin/./ff.bin.extension.remove.sh

exit 0
