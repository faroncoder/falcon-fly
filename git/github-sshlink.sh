#!/bin/bash
startgreen=`date +%s`
## VARIABLES MANAGEMENT


PACKGF="xclip"

function checkPackage {
	## CHECK FOR REQUIRED PACKAGE
	INpackgf=( $PACKGF )
	CHECKPACKAGE=( "$( $INpackgf -version )" )
	if [ ! -z "${CHECKPACKAGE}" ]
		then
			echo "$INpackgf is not installed - calling apt-get for $INpackgf ... "
			sudo apt-get install -y $INpackgf
		else
			echo ${CHECKPACKAGE}
			## Dummy file for xclip
			sudo touch blank
			echo "---------------"
			echo "Required package exists.  Let's proceed accordingly..."
	fi
	## Clearing clipboard memory out for xclip usage
	xclip -sel clip < $( $( touch blank; echo "" > blank; ) )
	sudo rm -f blank
}

function getEmail {
	echo -n "Email address for GITHUB ?  "
	read EMILA
}

function addSSHKEY {
	eval `ssh-agent -s`
	ssh-add $THEHOSTKEY
	xclip -sel clip < $THEHOSTKEYFILE
	echo "Wait for browser to pop up and click \"Add SSH key\" button and paste (Ctrl+v) your public key in there."
	firefox https://github.com/settings/ssh </dev/null
	mv $RESPONSEFILE $TRASH/
}

function beginSSHKEY {
	## generating key for GITHUB
	ssh-keygen -t rsa -C "$EMILA"
	## pushing script to listen for input  before system's inquiry
	read responseAutomate
	echo $responseAutomate
	## 	FIRES SCRIPT FUNCTION
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
	if [ -z "$RESPONSEFILE" ];
		then
			## IF RESPONSE FILE DOESN'T EXIST - LETS MAKE ONE
			echo "Automate Response: developing"
			touch $RESPONSEFILE
			echo $THEHOSTKEY > $RESPONSEFILE
			echo "\\n" >> $RESPONSEFILE
			echo "\\n" >> $RESPONSEFILE
			./$SELFFILE < $RESPONSEFILE
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD:git/github-sshlink.sh
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27:git/lab.git.access.link.sh
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	fi

	beginSSHKEY
	addSSHKEY
}

###################################
	getEmail
	respondData



<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD:git/github-sshlink.sh
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27:git/lab.git.access.link.sh
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347


