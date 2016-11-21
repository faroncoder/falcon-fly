#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
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
		rename "s/\"//g" *
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
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.filename.cleanup.sh  [ACTIVE] y

