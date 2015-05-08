#!/bin/bash

if [[ -d "$PWD/jsc/css" ]]; then
	 	find -L $PWD/jsc/css -maxdepth 1 -type f -name '*.css' -exec basename {} \; >> files.list
	 	echo "@charset \"UTF-8\";" > ./jsc/css/cssengine.css
	 	sed -i -e '/cssengine/d' files.list
	 	while read line
	 		do
				echo "@import url( $line );" >> ./jsc/css/cssengine.css;
        	done < files.list
        	rm files.list
        else
        	echo "We are not in a project folder.  Aborted"
        	exit 0
fi

exit 0

