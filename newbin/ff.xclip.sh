#!/bin/bash
startgreen=`date +%s`
# By keeping options in alphabetical order, it's easy to add more.

display_help() {
	echo "Sorry - help hasn't been developed yet"
}

while :
do
    case "$1" in
      -f | --file)
		if [[ -f "$2" ]]; then
			xclip -in -sel clipboard $2   # You may want to check validity of $2
			echo "parsed to memory!  CTRL-X to paste."
	  		shift 2
	  	else
	  		THISFILE=`uuid`
	  		echo $1 > "/tmp/$THISFILE-xclip.dat"
	  		xclip -sel clip < "/tmp/$THISFILE-xclip.dat"
	  		echo "clipped into memory!  CTRL-X to paste."
	  		shift 1
	  	fi
	;;
      -h | --help)
			display_help  # Call your function
			# no shifting needed here, we're done.
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
	;;
      -v | --verbose)
          #  It's better to assign a string, than a number like "verbose=1"
	  #  because if you're debugging script with "bash -x" code like this:
	  #
	  #    if [ "$verbose" ] ...
	  #
	  #  You will see:
	  #
	  #    if [ "verbose" ] ...
	  #
          #  Instead of cryptic
	  #
	  #    if [ "1" ] ...
	  #
	  verbose="verbose"
	  shift
	  ;;
      --) # End of all options
	  shift
	  break
	  ;;
      -*)
	  echo "Error: Unknown option: $1" >&2
	  exit 1
	  ;;
      *)  # No more options
	  break
	  ;;
    esac
done

# End of file



