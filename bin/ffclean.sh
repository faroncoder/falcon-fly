#!/bin/bash
rm -f $PWD/*.*~
rm -f $PWD/.*_*~
rm -f $PWD/*.sh~
rm -f $PWD/*~
rm -f $PWD/.*~
find $PWD -maxdepth 1 -type f -name '.*~' -exec rm -f {} \;
exit 0
