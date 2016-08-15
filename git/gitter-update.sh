#!/bin/bash
startgreen=`date +%s`
function gitupdategits {
<<<<<<< HEAD
BASELOC="$HOME/.falcon/scripting/falcon-gits"
=======
BASELOC="/home/faron/.falcon/scripting/home/faron/.falcon-gits"
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
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
<<<<<<< HEAD
BASELOC="$HOME/.falcon/scripting/falcon-fly"
=======
BASELOC="/home/faron/.falcon/scripts"
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
