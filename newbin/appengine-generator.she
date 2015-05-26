#!/bin/bash
startgreen=`date`
echo "\$.getScript(\"./jsc/jsc/$line\", function(data, textStatus) { " > script.dat
echo "       console.log(\"\BASHFILENAME loaded\", textStatus); " >> script.dat
echo "    });" >> script.dat
echo "generated a js block for 'appengine.js'"
echo ""


stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
