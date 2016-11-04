#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

pathdir="$PWD"
locpath="$1"


 echo -n "collect (c) | end (e) :  "
 read commandget
 if [ $commandget == "c" ]
    then
        if [ -z $locpath ]
      	then
      	echo -n "path you need to collect?  only here (h) | everything from here (a) | ( enter folder name from here ) : "
      	read locpath
              if [ $locpath == "h" ]
                then
                    filelocpath="$pathdir"
                    echo -n "confirming: $filelocpath (y/n) ? "
                    read proceedcollection
                        if [ $proceedcollection == "y" ]
                          then
                              echo "collecting..."
                              find $filelocpath -maxdepth 0 -exec stat --format "chown %G:%G ${MPOINT}%n && chmod %a ${MPOINT}%n" {} \; >>  restore-chmod-chown.sh
                              echo "done!"
                        fi
                  getmod_getowner_allfiles
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] getmod_getowner_all.sh  [ACTIVE] y

