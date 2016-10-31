#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
		gitnewname=$( basename $PWD )
		echo -n "Creating new branch $gitnewname.git.  Proceed? "
		read comfirmgit
		confirmgitnew="https://github.com/faroncoder/$gitnewname.git"

		if [ "$comfirmgit" == "y" ]
			then
				touch README.md
				git init
				git add README.md
				git add -A
				git commit -m "first commit"
				git remote add origin
				git push -u origin master $confirmgitnew
			else
				exit 1
		fi
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] git-new-repository.sh  [ACTIVE] y

