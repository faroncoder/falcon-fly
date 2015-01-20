#!/bin/bash
FARON_PATH="/usr/bin:/home/faron/bin:/home/local/bin"
export PATH="$PATH:$FARON_PATH"
LOG="/home/faron/bin/core/logs/faronrc/logging.log"
DTW=$( date )
FARONRC="/home/faron/.faronrc-listen"

function askServer {
      echo -n "which server ?"
      read SERVERL
      THISLOC="$PWD"
      echo "f1 | mkdir -p $THISLOC" >> .faroncmd
      scp .faroncmd faron@$SERVERL:$FARONRC/
}

function sendFilesNow {
       find $PWD -maxdepth 1 -type f ! -type d -exec scp {} faron@$SERVERL:$THISLOC/ \; -exec rm {} \;  -exec echo "$SERVERL" >> faronrc-file-sent.list  \; -exec echo {} \; >> faronrc-file-sent.list \;
}



function filechecking {
      ## INITATE NEW FILE
      > faronrc
      ## VERBOSE LISTING FILE TO FILE
     /usr/bin/find $PWD -maxdepth 1 -type f ! -type d >> faronrc
     ## INTIATE NEW FILE
     > faronrc-filecheck
     while read line
            do
                  ## FOR EVERY ENTRY FROM FILE FUNCTION IS PERFORMED EACH
                  ## SIMPIFY FILENAME WITHOUT PATH
                  FILEECHO=$( /usr/bin/basename $line )
                  echo $FILEECHO >> faronrc-filecheck
            ## FUNCTION FIRED INCYCLE WHILE READING FILE
            done < faronrc
            ## KILL FILE AS UNNEEDED
            rm faronrc
}

function filegrabname {
                  > faronrc-filelist
                  FILENAMELIST="$( /usr/bin/find $PWD -maxdepth 1 -type f ! -type d  -exec /usr/bin/basename {} \; )" >> faronrc-filelist
                  cat faronrc-filelist


                  # if [ -z "$FILENAMELIST" ]
                  #       then
                  #             echo "no files found"
                  #       else
                  #             FILEEXTDR="$( rev <<< "$( /usr/bin/basename \"$FILENAMELIST\" )" | cut -d "." -f2 | rev )"
                  #             printf "$FILEEXTDR"
                  # fi
}

      # for line in $( /usr/bin/find . -maxdepth 1 -type f ! -type d )
      #       do
      #             filegrabname
      #       done


function selfexecute {
      MEFILE="$( /usr/bin/basename $0 )"
      "./$MEFILENAME" | "$MEFILENAME"
}



askServer
sendFilesNow

#filegrabname
#findandsendfileout
#selfexecute
#This function self-execute the script in loop
exit 0
