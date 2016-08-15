#/bin/bash
PATHLOC=$1
# if [ -z "$1" ]
# 	then
# 				PATHLOC="$PWD"
# 	fi
#PREFILE="$( echo "$file" | cut -d "." -f1 )";
#ADUP=$( find $PATHLOC -maxdepth 1 -type d | sort | tail -1 )
#NAD=$( basename $ADUP )
#DUH="$( echo $NAD )"
MEXT=`expr 0 + 1`

orderfiles=( $( find $PWD -type f -name '*.mkv' ) )
for line in "${orderfiles[@]}";
	do
		getname=$( echo $line | cut -d '.' -f1 )
		getnewname=$( seq -w 0 $( echo $MEXT ) | tail -n 1 )
		mv $line $getnewname.mkv
		echo "moving $line $getnewname.mkv"

		#rename 's/$( echo $getname )/$( echo $getnewname )/g' $line
		MEXT=`expr $MEXT + 1`

		#find -name "$FILE*" -type f -exec mv {} $FILEASS
		#mv $line $FILEASS.$FILE

	done

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27

