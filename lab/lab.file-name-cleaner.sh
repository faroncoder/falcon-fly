#!/bin/bash
startgreen=`date +%s`
cd $PWD
#> tmp.txt
#find . -maxdepth 1 -type f ! -type d ! -name '*.txt' ! -name '*.sh' ! -name '*.dat' ! -name '*.list' -exec basename {} \; >>tmp.txt
#ls >> tmp.txt -I '*.txt*' -I '*.sh*' -I '*.dat' -I '*.list'
	rename "s/\ //g" *
		rename "s/'//g" *
		rename "s/;//g" *
		rename "s/,//g" *
		rename "s/\(//g" *
		rename "s/\)//g" *
		rename "s/\[//g" *
		rename "s/\]//g" *
		rename "s/&//g" *
		rename "s/_//g" *
		rename "s/\!//g" *
		rename "s/-//g" *
filelisting=( $( find . -maxdepth 1 -type f ! -type d ! -name '*.txt' ! -name '*.sh' ! -name '*.dat' ! -name '*.list' -exec basename {} \; ) )
for x in "${filelisting[@]}"
	do
		FILEIDNEW=$( echo $x | tr 'A-Z' 'a-z' )
		mv $x $FILEIDNEW  2>/dev/null
	done
#while read line
  #    do
            #FILEID="$line"
    #        FILEIDNEW=$( echo $line | tr 'A-Z' 'a-z' )
#            mv $line $FILEIDNEW 2>/dev/null
	#	mv $line $FILEIDNEW
      #done < tmp.txt
     # rm tmp.txt



      #find $FILEIDNEW -maxdepth 1 -type f ! -type d -exec rename "s/\ //g" {} \; -exec rename "s/'//g" {} \; -exec rename "s/;//g" {} \; -exec rename "s/,//g" {} \; -exec rename "s/\(//g" {} \; -exec rename "s/\)//g" {} \; -exec rename "s/\[//g" {} \; -exec rename "s/\]//g" {} \; -exec rename "s/&//g" {} \; -exec rename "s/_//g" {} \; -exec rename "s/\!//g" {} \; -exec rename "s/-//g" {} \;
<<<<<<< HEAD:bin/file-name-cleaner.sh
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27:bin/ff.bin.filename.cleanup.sh