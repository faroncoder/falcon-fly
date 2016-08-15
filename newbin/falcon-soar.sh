#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	exit 0
}

# if [ "$1" != "" ]; then
#################### BEGIN

$1()) {



}

gethtml() {
	> /tmp/test.html
	echo "<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>{TITLE}</title>
        <link href=\"./jsc/css/cssengine.css\" rel=\"stylesheet\" type=\"text/css\" />
        <!--[if lt IE 9]>
        <script src=\"//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js\"></script>
        <![endif]-->
        <script src=\"https://code.jquery.com/jquery-1.11.1.min.js\" type=\"text/javascript\"></script>
    </head>
    <body>

	<!-- SED-CUSTOM -->

        <!-- Javascript files -->
        <script src=\"https://code.jquery.com/jquery-1.11.1.min.js\" type=\"text/javascript\"></script>
        <script src=\"./jsc/js/appengine.js\" type=\"text/javascript\"></script>
        <script type=\"text/javascript\">
        \$(document).ready(function() {

	/* SED-CUSTOM-JS */

        }); //end ready
        </script>
    </body>
</html>" >> /tmp/test.html
}

getjava() {
	echo "oh no....not this time, my dear"
}


echo "Select session type:"
SELECT=""
while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    IFS= read -s -n 1 SELECT
 	echo "Debug/$SELECT/${#SELECT}"
 	case "$SELECT" in
 		h) gethtml ;;
		j) getjava ;;
		x) echo "exiting"; break; ;;
	esac

    [[ "$SELECT" == $"" ]] && echo "enter" # do foo
    [[ "$SELECT" == $" " ]] && echo "space" # do bar
done



################### END
# elif [ "$1" = "" ];
# 	then
#   echo "usage: keystroke-capture "
#   echo "example:    "
# fi


## TALON: keystroke-capture


