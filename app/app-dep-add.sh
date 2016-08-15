#!/bin/bash
startgreen=`date +%s`
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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
