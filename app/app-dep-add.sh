#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
package="$PWD/package.json"
checkjson=$( find $PWD -maxdepth 1 -type f -name 'package.json' )
if [ -z "$checkjson" ]; then

       echo "application name? "
       read APPNAME
            echo "
{
  \"name\": \"$APPNAME\",
  \"version\": \"0.0.1\",
  \"description\": \"\",
  \"main\": \"app.js\",
  \"dependencies\": {
  },
  \"scripts\": {
    \"test\": \"echo \"\"Error: no test specified\"\" && exit 1\"
  },
  \"author\": \"Faron the Falcon\"
}
" >> $package
cat package.json
else
    APPNAME=$( jq -r '.name' package.json )
    echo $APPNAME
fi

EXISTDEP=$( grep 'dependencies' package.json)

if [ -z "$EXISTDEP" ]
    then
        sed -i -e "/main/a \\t \"dependencies\":\ {\n\n\ \\t },"  $package
fi




# deppack="$1"

# if [ -z "$deppack" ];
#         then
#             echo "Need to add package if you want to fix package.json..."
#             exit 2
# fi

# if [ -z "$checkjson" ];
#     then
#                 sed -i "/main/a \"dependencies\":\ {\n\\ \ \""$deppack"\"\ :\ \"\*\",\n\ \ \ }," $package
#                # sed -i -e 's/\"dependencies\":\ {},/\"dependencies\":\ {\n\t},/g' $package
# fi

# DepJsn="$( grep 'dependencies' $package )"

# if [ -z "$DepJsn" ]; then
#              $package
# fi

# cat $package

#            #echo -n "Which dependency to install? "
# 	#read npmdep

# #sed  -i -e "/\$npmdep/d" $pathdir/package.json
# #echo "$npmdep removed"
# #npm uninstall $npmdep
# #npm install

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] app-dep-add.sh  [ACTIVE] y

