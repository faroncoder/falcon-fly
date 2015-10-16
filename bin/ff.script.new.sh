#!/bin/bash
XsB=`date +%s`
function XcF {
XfE=`date +%s`; XcT=$( echo "$(( $XsB - $XfE ))" ); logger "$0 | $XsB | $XfE | $XcT "; exit 0
}
newfile="$1"
loc="$2"

if [ -z "$newfile" ]; then
	echo -n "name of new file? "
	read newfile
fi
if [ -z "$loc" ]; then
 	GETFALCONS=( $( find $HOME/.falcon/scripts -maxdepth 1 -type d ! -type f -exec basename {} \; | sed '/.git/d' | sed '/icons/d' | sed '/scripts/d' | sort | tr '\n' ' ' ) )
 	MEXT=1
 	for newbinhome in "${GETFALCONS[@]}"; do
 		GETID=$MEXT
 		GETFILE=`basename $newbinhome`
 		CATCHOUPUT=( ${CATCHOUPUT[@]} $( printf "$GETID) loc=$HOME/.falcon/scripts/$newbinhome/$newfile; break ;; | "  ) )
 		echo "$GETID) loc=$HOME/.falcon/scripts/$newbinhome/$newfile; break ;; " >>$FILETEMP
 		INPUTSIGNAL=( ${INPUTSIGNAL[@]} $( echo "$GETID:$GETFILE") )
 		MEXT=`echo $(( $MEXT + 1 ))`
 	done
 	FILETEMP="`uuid`.sh"
 	echo "#!/bin/bash" >> $FILETEMP
	echo "case \$selection in " >> $FILETEMP
	echo "${CATCHOUPUT[@]} | sed 's/:/)/g' | sed 's/|/\\n/g'" >> $FILETEMP
	echo "*) break ;;" >> $FILETEMP
	echo "easc" >> $FILETEMP
	echo "exit 0" >> $FILETEMP
	chmod +x $FILETEMP
	selection=
	until [[ "$selection" = 0 ]]; do
		./$FILETEMP
	done
	echo "${CATCHOUPUT[@]}"
	echo -n "which category?  "
	read selection





# 	do
# 		LINEENTRY="echo \"$( basename $ONEFILE\" ) ;;"
# 		echo "$THISINT ) $LINEENTRY "
# 		THISINT=`expr $THISINT + 1`
# 	done

#  		#OPTIONLINE=( "${OPTIONLINE[@]}" "$GETID) newbin=$HOME/.falcon/scripts/$newbinhomd; break; ;;" )
#  	done
#  	echo "------------------------"
#  	echo ${INPUTSIGNAL[@]}
#  	echo "------------------------"
#  populateOptions(){
#  	INSERT1=`echo ${CATCHOUPUT[@]} | sed 's/:/)/g' | sed 's/|/\\n/g'`


# 	WHILEINSERT=`while :
# 		do
# 			case $1 in
# 				$INSERT1
# 			esac
# 		done
# 	echo "$WHILEINSERT"
# }
# 	`eval populateOptions`

#  	#glopoutoptions() {
#  	#	for optionlineinsert in "${OPTIONLINE[@]}"; do
#  	#		echo "$optionlineinsert"
 	#	done
 	#}
 fi
	# while :
	# 	do
	# 	case "$1" in
	# 		glopoutoptions
	# 	;;
	# 	esac
	# done

# 	echo "which category? ${GETFALCONS[@]} "
# 	read newfile
# fi
# ##DETERMINING WHICH APP TO OPEN THE SCRIPT DEPENEDING ON WHICH SERVERS
# SRVNAME=`hostname --short`
# proofreadfile="$( echo $newfile | tr '  ' ' ' | sed 's/.sh//g' ).sh"
# touch $newbin/$proofreadfile
# chmod +x $newbin/$proofreadfile
# echo "#!/bin/bash
# XeB=\`date +%s\`
# if [ \"\$( echo \$PATH | grep '/home/faron/.bin/' )\" = '' ]; then
# 	export PATH=\$PATH:/home/faron/.bin
# fi
# #if [[ \"\$SRVNAME\" != 'f10' ]]; then
# #	YOUR CUSTOM COMMAND
# #else
# #	YOUR CUSTOM COMMAND
# #fi
# function XeF {
# XeE=\`date +%s\`; XeT=\$( echo \"\$(( \$XeB - \$XeE ))\" ); logger \"\$0 | \$XeB | \$XeE | \$XeT \"; exit 0
# }
# #if [ \"$1\" != \"\" ]; then
# #################### BEGIN



# ################### END
# #elif [ \"$1\" = '' ];
# #	then
# #  echo \"usage:  \"
# #  echo \"example:    \"
# #fi
# ## TALON:
# XeF
# " >> $newbin/$proofreadfile



