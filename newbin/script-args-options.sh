#!/bin/bash
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
	  	exit 0
	  ;;
      -u | --user)
	  	 if [ ! -z "$2" ]; then
		  		username="$2"
		  		echo $2
		  		shift 2
		  	else
		  		echo "Error: $1 requires username" >&2
	  			shift
	  	fi
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



