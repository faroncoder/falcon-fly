#!/bin/bash
startgreen=`date`
# By keeping options in alphabetical order, it's easy to add more.

display_help() {
	cat "$HOME/.bash_colors"
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
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
	  ;;
      -u | --user)
	  username="$2"
	  echo $2 # You may want to check validity of $2
	  shift 2
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



