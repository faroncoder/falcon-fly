#!/bin/sh -e

 LOC="$1"
if [ -z "$LOC" ]
	then
	    LOC="$PWD"
fi


#PATHDIR=$PWD
#FINDLINK="$( find $PATHDIR -maxdepth 1 -name 'Link*to*' -exec rename 's/Link\ to\ //g' {} \; )"
find $LOC -maxdepth 1 -name 'Link*to*' -exec rename 's/Link\ to\ //g' {} \; -exec echo "`basename {}` updated." \;
#-exec DISPLAY=0:0 /usr/bin//notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: {} :: link cleaned up " \;
# > x.list
# ls Link* >> x.list
# sed -i -e 's/\ /\\ /g' x.list
# while read line
# 	do
# #FINDLINK="$( ls Link* )"
# #if [ ! -z "$FINDLINK" ]
#             #then
# 	           		/usr/bin//rename 's/Link\ to\ //g' $line;
# 	                       /usr/bin//rename 's/.sh//g' $line;
#  			DISPLAY=:0.0 /usr/bin//notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: $( echo $line ) :: link cleaned up ";
#  done
#  rm x.list
<<<<<<< HEAD:bin/file-link-cleaner.sh
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27:bin/ff.bin.link.cleanup.sh
