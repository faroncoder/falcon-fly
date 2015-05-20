#!/bin/bash
echo "\$.getScript(\"./jsc/jsc/$line\", function(data, textStatus) { " > script.dat
echo "       console.log(\"\BASHFILENAME loaded\", textStatus); " >> script.dat
echo "    });" >> script.dat
echo "generated a js block for 'appengine.js'"
echo ""


exit 0
