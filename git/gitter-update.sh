#!/bin/bash
startgreen=`date +%s`
function gitupdategits {
BASELOC="/home/fly/scripting/falcon-gits"
GIT="/home/faron/tmp/gits.list"
cd $BASELOC
> $GIT
find $BASELOC -maxdepth 2 -type d -name '.git' -exec dirname {} \; > $GIT
while read line
      do
            ## reverify that .git does exist


                              cd $line
                              echo "updating GIT for $line..."
                              #git fetch
                              #git pull
                              #git add -A
                              #git status
                              #git commit
                              #git push -u origin master
                              gitter -u -n "$GETNAME"
                              #GETNAME="$line.git"
                              echo "GIT $GETNAME :: updated!"

                 #             sed -i -e '/$line/d' $GIT
                  #fi
      done < $GIT
TOTALGIT="$( cat $GIT | wc -l )"
echo "Total gits: $TOTALGIT"
ffrm gits.list
}

function gitupdatemaster {
BASELOC="/home/fly/scripts"
cd $BASELOC
                              echo "updating GIT for $line..."
                              #git fetch
                              #git pull
                              #git add -A
                              #git status
                              #git commit
                              #git push -u origin master
                              GETNAME="$line.git"
                              gitter -u -n "$GETNAME"
                              echo "GIT $GETNAME :: updated!"
}

gitupdatemaster
gitupdategits

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
