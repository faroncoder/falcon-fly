#!/bin/bash
PROJ=$1
if [ -z "$PROJ" ]; then
	PROJ=$PWD
fi
# else
# 	PROJ=$( find -L $PROJ -type d -name "*jsc" -exec dirname {} \; )
# fi
if [ -d "$PROJ/jsc" ]; then
		JSCLOC="$PROJ/jsc"
		if [ -d "$PROJ/.jsc" ];	then
			JSCLOC="$PROJ/.jsc"
		fi
	else
		echo "No JSC. Exiting."
		exit 1
fi
# PROJsc=$( find -L $PROJ -type d -name "*jsc" -exec basename {} \; )
TYPE="css"
FILEPOINT="cssengine.$TYPE"
DOME="$JSCLOC/$TYPE"
if [ -d "$DOME" ];
		then
		echo "Entering css folder."
		cd $DOME
else
		if [ ! -d "$DOME" ]; then
			echo "No JSC.  Exiting."
			exit 2
		fi
fi

CSSGLOP=$( find -L . -maxdepth 1 -type f -name '*.css' ! -name 'cssengine.css' )

glopperGo() {
		RESULT=$( echo ${CSSGLOP[@]} | wc -w )
		echo "$RESULT $TYPE files glopped"
}

CSSGLOPPER=( $( find -L . -maxdepth 1 -type f -name '*.css' ! -name 'cssengine*' -exec basename {} \; ) )
if [[ -z "$CSSGLOPPER" ]]; then
	echo "No $TYPE files to glop"
else
	> $FILEPOINT
	echo "@charset \"UTF-8\";" > "$FILEPOINT"
	echo "@import url(http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css);" >> "$FILEPOINT"
	for b in "${CSSGLOPPER[@]}"; do
		INJECTION="@import url(`printf  \"'$b'\"`);"
	 	echo $INJECTION >> "$FILEPOINT"
	done
	glopperGo
fi
cd $PROJ

exit 0

