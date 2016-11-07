#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
# By keeping options in alphabetical order, it's easy to add more.

display_help() {
	cat "$HOME///.bash_colors"
}

while :
do
    case "$1" in
      -f | --file)
	  file="$2"   # You may want to check validity of $2
	  shift 2
	  ;;
      -h | --help)
	  display_help  # Call your function
	  # no shifting needed here, we're done.
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] script-args-options-function-with-sub-agrument.sh  [ACTIVE] y

