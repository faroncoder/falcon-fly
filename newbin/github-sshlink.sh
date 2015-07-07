#!/bin/bash
## VARIABLES MANAGEMENT


PACKGF="xclip"

function checkPackage {
	## CHECK FOR REQUIRED PACKAGE
	INpackgf=( $PACKGF )
	CHECKPACKAGE="$( $INpackgf -version )"
	if [ ! -z "${CHECKPACKAGE}" ]
		then
			echo "$INpackgf is not installed - calling apt-get for $INpackgf ... "
			sudo apt-get install -y $INpackgf
		else
			echo "$CHECKPACKAGE"
			## Dummy file for xclip
			FILE=`uuid`
			THISFILE="$FILE-xclip.dat"
			touch "$THISFILE"
			echo "---------------"
			echo "Required package exists.  Let's proceed accordingly..."
	fi
	## Clearing clipboard memory out for xclip usage
	FILE=`uuid`
	THISFILE="/tmp/$( `uuid`-xclip.dat )"
	xclip -sel clip < echo $THISFILE
	rm -f $THISFILE
}

function getEmail {
	echo -n "Email address for GITHUB ?  "
	read EMILA
}

function addSSHKEY {
	`ssh-agent -s`
	ssh-add "$THEHOSTKEY"
	xclip -sel clip < "$THEHOSTKEYFILE"
	echo "Wait for browser to pop up and click \"Add SSH key\" button and paste (Ctrl+v) your public key in there."
	chromium-browser "--app=https://github.com/settings/ssh"
	mv "$RESPONSEFILE" "$TRASH/"
}

function beginSSHKEY {
	## generating key for GITHUB
	ssh-keygen -t rsa -C "$EMILA"
	## pushing script to listen for input  before system's inquiry

}



function respondData {
	#SETTING VARIABLE
	SELFFILE=$( basename $0 )
	RESPONSEFILE="$SELFFILE.txt"
	THISHOST=$( hostname -s )
	THEHOSTKEY="$HOME/.ssh/$THISHOST-github"
	THEHOSTKEYFILE="$THEHOSTKEY.pub"
	TRASH="$HOME/.local/share/Trash/files"



	# if [ ! -z "$THEHOSTKEY" ];
	# 	then

	# 		mv $THEHOSTKEY $TRASH/
	# 		echo "Private key exists - but will be replaced..."
	# 	else
	# 		echo "No prior history for this private key..."

	# fi
	# if [ ! -z "$THEHOSTKEYFILE" ];
	# 	then
	# 		mv $THEHOSTKEYFILE $TRASH/
	# 		echo "Public key exists - but will be replaced..."

	# 	else
	# 		echo "No prior history for this public key..."

	# fi

	## CHECKS IF RESPONSE FILE EXISTS
	# if [ -z "$RESPONSEFILE" ];
	# 	then
	# 		## IF RESPONSE FILE DOESN'T EXIST - LETS MAKE ONE
	# 		echo "Automate Response: developing"
	# 		touch $RESPONSEFILE
	# 		echo $THEHOSTKEY > $RESPONSEFILE
	# 		echo "\\n" >> $RESPONSEFILE
	# 		echo "\\n" >> $RESPONSEFILE
	# 		./$SELFFILE < $RESPONSEFILE
	# 		exit 0
	# fi

	beginSSHKEY
	addSSHKEY
}

###################################
	getEmail
	respondData



exit 0


