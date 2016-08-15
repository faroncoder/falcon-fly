#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '' ]; then
	export PATH=$PATH:/usr/local/bin:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
<<<<<<< HEAD
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
}

#if [ "$1" != "" ]; then
#################### BEGIN


#!/bin/sh
# Copyright 2015 Jan-Philip Gehrcke, http://gehrcke.de
# See http://gehrcke.de/2015/03/uploaded-to-download-with-wget/


USERNAME="btmup"
PASSWORD="faronFucks11"


if [ "$#" -ne 1 ]; then
    echo "Missing argument: URLs file (containing one URL per line)." >&2
    exit 1
fi


URLSFILE="${1}"
if [ ! -r "${URLSFILE}" ]; then
    echo "Cannot read URLs file ${URLSFILE}. Exit." >&2
    exit 1
fi
if [ ! -s "${URLSFILE}" ]; then
    echo "URLs file is empty. Exit." >&2
    exit 1
fi


TMPDIR="$(mktemp -d)"
# Install trap that removes the temporary directory recursively
# upon exit (except for when this program retrieves SIGKILL).
#trap 'rm -rf "$TMPDIR"' EXIT


LOGINRESPFILE="${TMPDIR}/login.response"
LOGINOUTPUTFILE="${TMPDIR}/login.outerr"
COOKIESFILE="${TMPDIR}/login.cookies"
LOGINURL="http://uploaded.net/io/login"


echo "Temporary directory: ${TMPDIR}"
echo "Log in via POST request to ${LOGINURL}, save cookies."
wget --save-cookies=${COOKIESFILE} --server-response --output-document ${LOGINRESPFILE} --post-data="id=${USERNAME}&pw=${PASSWORD}" ${LOGINURL} > ${LOGINOUTPUTFILE} 2>&1

# Status code is 200 even if login failed.
# Uploaded sends a '{"err":"User and password do not match!"}'-like response
# body in case of error.

echo "Verify that login response is empty."
# Response is more than 0 bytes in case of login error.
if [ -s "${LOGINRESPFILE}" ]; then
    echo "Login response larger than 0 bytes. Print response and exit." >&2
    cat "${LOGINRESPFILE}"
    exit 1
fi

# Zero response size does not necessarily imply successful login.
# Wget adds three commented lines to the cookies file by default, so
# set cookies should result in more than three lines in this file.
COOKIESFILELINES="$(cat ${COOKIESFILE} | wc -l)"
echo "${COOKIESFILELINES} lines in cookies file found."
if [ "${COOKIESFILELINES}" -lt "4" ]; then
    echo "Expected >3 lines in cookies file. Exit.". >&2
    exit 1
fi

echo "Process URLs."
# Assume that login worked. Iterate through URLs.
while read CURRENTURL; do
    if [ "x$CURRENTURL" = "x" ]; then
        # Skip empty lines.
        continue
    fi
    echo -e "\n\n"
    TMPFILE="$(mktemp --tmpdir=${TMPDIR} response.html.XXXX)"
    echo "GET ${CURRENTURL} (use auth cookie), store response."
    wget --no-verbose --load-cookies=${COOKIESFILE} \
        --output-document ${TMPFILE} ${CURRENTURL}

    if [ ! -s "${TMPFILE}" ]; then
        echo "No HTML response: ${TMPFILE} is zero size. Skip processing."
        continue
    fi

    # Extract (temporarily valid) download URL from HTML.
    LINEOFINTEREST="$(grep post ${TMPFILE} | grep action | grep uploaded)"
    # Match entire line, include space after action="bla" , replace
    # entire line with first group, which is bla.
    DLURL=$(echo $LINEOFINTEREST | sed 's/.*action="\(.\+\)" .*/\1/')
    echo "Extracted download URL: ${DLURL}"
    # This file contains account details, so delete as soon as not required
    # anymore.
    #rm -f "${TMPFILE}"
    echo "POST to URL w/o data. Response is file. Get filename from header."
    # --content-disposition should extract the proper filename.
    wget --content-disposition --post-data='' "${DLURL}"
done < "${URLSFILE}"




# # for NUM in {55..0}
# # do
# #    printf "$URLK"
# # done

# for i in {55..1};  do \
# 	URLK="http://entnt.com/thread-1445168-$i-5.html" \
#    	GETURLS=(  `echo "$URLK"` ) \
# done

# for grab in "${GETURLS[@]}"; do
# 	curl --url $grab | grep 'rar'
# done




## FUNCTIONS

## SCRIPTING


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: grabfilesdownload "
#  echo "example:    "
#fi


## TALON: grabfilesdownload
XeF


