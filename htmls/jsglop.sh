#!/bin/bash

function templateJSAppEngine ( echo "
\$\(function(data, textStatus\) \{
    // BEGIN CUSTOM SCRIPTING //


    // END CUSTOM SCRIPTING //
\}\); // end function
        " > $PWD/jsc/js/appengine.js )


if [[ -d "$PWD/jsc/js" ]]; then
	    GETALLJS=( "$( find -L . -maxdepth 1 -type f -name '*.js' ! -name 'appengine.js' ! -name 'jsengine.js' ! -name 'bootstrap*' )" )
        for l in "${GETALLJS[@]}";
        	do
        		templateJSAppEngine
 SETJSLINE="\$.getScript(\"./\$l\", function(data, textStatus) {
        console.log(\"\$l loaded\", textStatus);
    });"
                        sed -i "/BEGIN/a $SETJSLINE" appengine.js

        	done
        else
        	echo "We are not in a project folder.  Aborted"
        	exit 1
fi

exit 0

