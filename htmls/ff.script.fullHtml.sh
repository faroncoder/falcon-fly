#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#################### BEGIN
 newscript="<!DOCTYPE html>
<html lang=\"en\">
    <head>
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge,chrome=1\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
        <meta name=\"description\" content=\"\">
        <meta name=\"author\" content=\"faron\">
        <title>{TITLE}</title>
        <link href=\"./.jsc/css/cssengine.css\" rel=\"stylesheet\" type=\"text/css\"></link>
        <!--[if lt IE 9]>
        <script src=\"//cdnjs.cloudflare.com/ajax/libs/html5shiv/r29/html5.min.js\"></script>
        <![endif]-->
    </head>
    <body>
        <!-- SED-CUSTOM -->
        <!-- Javascript files -->

 <script src=\"https://code.jquery.com/jquery-1.12.4.min.js\"
              integrity=\"sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=\"
              crossorigin=\"anonymous\"></script>
        <script src=\"./.jsc/js/appengine.js\" type=\"text/javascript\"></script>
        <script type=\"text/javascript\">
        /* SED-CUSTOM-javascript */
        \$(document).ready(function() {
        /* SED-CUSTOM-JQ */
        }); //end ready
        </script>
    </body>
</html>
"

NAME=$1
if [[ "$NAME" == "" ]]; then
	echo -n "$Finfo Name of script?     "
	read NAME
fi
echo "$Fok script created"
echo "$newscript" > "$HOME/falcon-$NAME.html"
sed -ie "s/{NAME}/$NAME/g" "$HOME/falcon-$NAME.html"

################### END
cd  $RETURN 1> /dev/null 2> /dev/null;
XeF  ### exit code for clean exit
### [ FILE:$MEF ACTIVE:y ]
