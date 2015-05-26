#!/bin/bash
startgreen=`date +%s`
      echo -n "alias name? "
      read aliasesname
      echo -n "command for $aliasesname? "
      read aliascomm

queryalias="alias $aliasesname=\" $aliascomm \""
echo $queryalias >> $HOME/.falcon/bash/.bash_aliases

echo "alias added..."

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
