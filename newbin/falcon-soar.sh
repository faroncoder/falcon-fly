#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

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



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] falcon-soar.sh  [ACTIVE] y

