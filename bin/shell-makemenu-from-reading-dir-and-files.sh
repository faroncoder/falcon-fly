#!/bin/bash
BINPULL="$HOME/.falcon/scripting/faron-scriptor/htmls/VALVE"

#function populateoption {
	#find $BINPULL -type f ! -name '*old*' -exec basename {} \;
#	echo -n "which package to install (full filename) ? "

#}

function injectHead {   
		selection=
		until [ \"\$selection\" = \"0\" ]; do 
		echo -n "which target? "
		`case $selection in`

}





function injectRules {
	THISINT=1
	GETALLFILES=( "$( find . -maxdepth 1 -type f )" );
	for ONEFILE in ${GETALLFILES[@]};
	do
		LINEENTRY="echo \"$( basename $ONEFILE\" ) ;;"
		echo "$THISINT ) $LINEENTRY "
		THISINT=`expr $THISINT + 1`
	done
}


function injectFoot {	echo " * ) break ;; "
		echo "esac "
		echo "done "
}

		


injectHead
injectRules
injectFoot
echo -n "which target ?"	
read selection 
printf "echo \$ONEFILE"


#function fileentrypop { 
#	
#		
#		
#			do
#				
#			done
#	
#	echo "which target? "
#	read selection
#function injectionMenu {
#THISINT=1
#for thisfiles in "${GETALLFILES[@]}"
#			
#			do
#				fileider="$i_$thisfile"
#				printf "$THISINT ) echo \"I am $THISINT and my file is $thisfile, and my id is $fileider\" ;; \n"
#			THISINT=`expr $THISINT + 1`
#			done
#}



#    echo ""
#    case $selection in
#        1 ) cd $path && ./bash-menu-system.sh ;;
#        2 ) cd $path && ./bash-menu-nodes.sh ;;
#        3 ) cd $path && ./bash-menu-spells.sh ;;
#        * ) break ;;
#    esac
#done
#	read PICK
#	cp "$BINPULL/$PICK" "$PWD/$PICK"
#	tar -zvxf $PICK
#	rm $PICK
#}

#populateoption

#   echo -n "which type of movie to be bind to new html? "
#	read TYPE
#	EXT=$( echo "$TYPE" | cut -d '.' -f2 )
#
#orderfiles=( $( find $PWD -type f -name "*.$EXT" | rev | cut -d "/" -f1 | rev ) )
#if [ "$EXT"="flv" ]
#	then
	#	EXTTYPE="x-flv"
#	fi
#
#if [ "$EXT"="mp4" ]
#	then
#	EXTTYPE="mp4"
#fi
#if [ "$EXT"="webm" ]
#	then
#	EXTTYPE="webm"
#fi
#
#echo -n "[f]ile or [u]rl? "
#			read TYPEURL
#
#			if [ $TYPEURL="f" ];
#				then
#					FILELOCA="./jsc/media";
#			fi
#			if [ "$TYPEURL"=="u" ];
#				then
#					echo -n "address of url (including http or such protocol)? ";
#					read FILELOCA;
#			fi

#for f in "${orderfiles[@]}";
#	do
#		mv "$f" "./jsc/media/$f"
#		NAME="$( rev <<< "$f" | cut -d "." -f2 | rev )"
#		cat ./jsc/templates/videoplayer.html | sed "s/FILENAMEME/$( echo $NAME )/g" > "$NAME.html"
#		sed -i -e "s/FILELOCA/$( echo $FILELOCA )/g" "$NAME.html"
#		sed -i -e "s/EXTTYPE/$( echo $EXTTYPE )/g" "$NAME.html"
#		sed -i -e "s/EXT/$( echo $EXT )/g" "$NAME.html"




#done



# if [ "$EXT"="ts" ]
# 	then
# 	EXTTYPE=$( echo "MP2T" )
# fi



# if [ -z "$FORMAT" ]
# 	then
# 	echo -n "which format to output (.ts or same type)? "
# 	read FORMAT
# 	if [ "$FORMAT"="ts" ] && [ "$EXT"="flv" ]
# 		then
# 			echo "pass"
# 			##FIREME=$( cd jsc/media; flv-tsx-er )
# 	elif  [ "$FORMAT"="ts" ] && [ "$EXT"="mp4" ]
# 		then
# 			echo "pass"

# 			##FIREME=$( cd jsc/media; ts-tsx-er )
# 	else
# 		FORMAT="$EXT"
# 	fi
# fi











	# if [ "$EXT"="flv" ]
	# then
	# 	cd ./jsc/media
	# 	/home/faron/bin/flv-tsx-er
	# fi



exit 0
