#!/bin/bash
startgreen=`date +%s000`
function stopwatchtime() { stopred=`date +%s000`; faronruntime=$( echo `expr $startgreen - $stopred` ); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
} ######## IGNORE ABOVE -- LOGGING PURPOSE ### USE 'stopwatchtime' to exit


echo "is it working?"

stopwatchtime


startgreen=\`date +%s\` \\n function stopwatchtime() { \\n stopred=\`date +%s\` \n faronruntime=\$( echo \`expr \$startgreen - \$stopred\` ) \\n echo \"\$0 | \$startgreen | \$stopred | \$faronruntime \" >> /home/faron/.falcon/logs/scripts.log; \\n exit 0 \\n } \\n ######## IGNORE ABOVE -- LOGGING PURPOSE ######## \\n ######## use 'stopwatchtime' instead of 'exit 0' ######## \\n
