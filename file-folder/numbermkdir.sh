#/bin/bash
PATHLOC="$1"
if [ -z "$1" ]
	then
		echo -n "which directory that has the latest filename order? "
		read PATHLOC
		if [ -z "$PATHLOC" ]
			then
				PATHLOC=""
		fi

fi

ADUP=$( find $PATHLOC -maxdepth 1 -type d | sort | tail -1 ) 
NAD=$( basename $ADUP )
DUH="$( echo $NAD )"
MEXT=`expr $DUH + 1`

ls $PWD > a.list
sed -i -e '/.sh/d' a.list
sed -i -e '/.list/d' a.list

> mkdir.list

while read line
	do
		FILEASS=$( seq -w 000000 $MEXT | tail -1 )
		echo $FILEASS $line >> mkdir.list
		MEXT=`expr $MEXT + 1`
	done < a.list
rm a.list

while read line
	do
		MKDIR=$( echo $line | awk '{ print $1 }' )
		FILETR=$( echo $line | awk '{ print $2 }' )
		mkdir -p $MKDIR
		mv $FILETR $MKDIR/
	done < mkdir.list
rm mkdir.list
	
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

