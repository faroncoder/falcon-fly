#!/bin/bash
CSSGLOP=(  `find -L $PWD -maxdepth 1 -type f -name '*.css' ! -name 'cssengine.css'` )
TYPE="css"
FILEPOINT="$PWD/cssengine.$TYPE"
glopperGo() {
		RESULT=$( echo ${CSSGLOP[@]} | wc -w )
		echo "$RESULT $TYPE files glopped"
	}
CSSGLOPPER=( `find -L $PWD -maxdepth 1 -type f -name '*.css' ! -name 'cssengine*' -exec basename {} \; ` )
if [[  -z "$CSSGLOPPER" ]]; then
	echo "No $TYPE files to glop"
else
	> $FILEPOINT
	echo "@charset \"UTF-8\";" > "$FILEPOINT"
	echo "@import url(http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css);" >> "$FILEPOINT"
	for b in "${CSSGLOPPER[@]}"; do
		INJECTION="@import url(`printf  \"'$b'\"`);"
	 	echo $INJECTION >> "$FILEPOINT"
	done
fi
exit 0