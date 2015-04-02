#!/bin/bash
FILE="$1"
if [ -z "$FILE" ];
	then
	find $PWD ! -perm /+x
	echo -n "which file you need to test? "
	READ FILE
fi
cd $PWD
chmod /+x $FILE
./$FILE
exit 0
\#!/bin/bash


exit 0

