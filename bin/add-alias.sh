#!/bin/bash
      echo -n "alias name? "
      read aliasesname
      echo -n "command for $aliasesname? "
      read aliascomm

queryalias="alias $aliasesname=\" $aliascomm \""
echo $queryalias >> /home/faron/bin/core/data/bash/bash_aliases

echo "alias added..."

exit 0