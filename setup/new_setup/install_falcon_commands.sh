#!/bin/bash

HERE=$PWD
cd "source /usr/local/bin"
GETA=( `find /home/users/faron/.falcon/scripts -type f -name 'ff.*' `  )
 for j in "${GETA[@]}";  do
 	ln -s $j
 done
source /usr/local/bin/./ff.bin.extension.remove.sh

exit 0
