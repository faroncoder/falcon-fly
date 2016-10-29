#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#################### BEGIN

find $HOME/.falcon/scripts -type f -exec sed -i -e 's/AIzaSyCOagcFwhzewSG_KPAa3x1lD6pVxPw3WSM'
################### END
XeF  ### exit code for clean exit
### [ FILE:$MEF ACTIVE:y ]
