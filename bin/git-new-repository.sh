#!/bin/bash
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
exit 0