#!/bin/bash
> tmp.txt
ls >> tmp.txt
while read line
      do
            FILEID="$line"
            FILEIDNEW=$( echo $FILEID | tr 'A-Z' 'a-z' )
            mv $FILEID $FILEIDNEW 2>/dev/null
      done < tmp.txt
      rm tmp.txt

      find $FILEIDNEW -maxdepth 1 -type f ! -type d -exec rename "s/\ //g" {} \; -exec rename "s/'//g" {} \; -exec rename "s/;//g" {} \; -exec rename "s/,//g" {} \; -exec rename "s/\(//g" {} \; -exec rename "s/\)//g" {} \; -exec rename "s/\[//g" {} \; -exec rename "s/\]//g" {} \; -exec rename "s/&//g" {} \; -exec rename "s/_//g" {} \; -exec rename "s/\!//g" {} \; -exec rename "s/-//g" {} \;
exit 0
