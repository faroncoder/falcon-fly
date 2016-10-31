#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
# By keeping options in alphabetical order, it's easy to add more.

while :
do
    case "$1" in
      -f | --file)
		  # You may want to check validity of $2
		  if [ ! -z "$2" ]; then
		  		file="$PWD/$2"
		  		if [ -f "$file" ]; then
		  			echo "$file verified as file"
		  			shift 2
		  		else
		  			echo "Error: $2 is not a file - ignoring" >&2
		  			echo "Error: moving $2 as next argument"
		  			shift
		  		fi
			else
				echo "Error: $1 requires file" >&2
				shift
				exit 1
		fi
	  ;;
      -h | --help)
	  	display_help  # Call your function
	  	# no shifting needed here, we're done.
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] script-args-options.sh  [ACTIVE] y

