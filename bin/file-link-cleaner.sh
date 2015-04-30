#!/bin/sh -e

 LOC="$1"
if [ -z "$LOC" ]
	then
	    LOC="$PWD"
fi


#PATHDIR=$PWD
#FINDLINK="$( find $PATHDIR -maxdepth 1 -name 'Link*to*' -exec rename 's/Link\ to\ //g' {} \; )"
find $LOC -maxdepth 1 -name 'Link*to*' -exec rename 's/Link\ to\ //g' {} \; -exec DISPLAY=0:0 /usr/bin/notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: {} :: link cleaned up " \;
# > x.list
# ls Link* >> x.list
# sed -i -e 's/\ /\\ /g' x.list
# while read line
# 	do 
# #FINDLINK="$( ls Link* )"
# #if [ ! -z "$FINDLINK" ]
#             #then
# 	           		/usr/bin/rename 's/Link\ to\ //g' $line;
# 	                       /usr/bin/rename 's/.sh//g' $line;
#  			DISPLAY=:0.0 /usr/bin/notify-send -i /home/faron/var/Pictures/self/sunfaron.png "bin: $( echo $line ) :: link cleaned up ";
#  done
#  rm x.list
exit 0
