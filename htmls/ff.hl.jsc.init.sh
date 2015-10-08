#!/bin/bash
startgreen=`date +%s`
stopwatchtime(){
  stopred=`date +%s`
  faronruntime=$( echo "$(( $stopred - $startgreen ))" )
  echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/fly/logs/scripts.log
  #exit 0
}
######## IGNORE ABOVE -- LOGGING PURPOSE ########
######## use 'stopwatchtime' instead of 'exit 0' ########

PATHDIRHOME="$1"
if [ "$PATHDIRHOME" = '' ]; then
				PATHDIRHOME="$PWD"
			fi
JSCFILE="jsc-build.tar.bz2"
BIN="/home/faron/.falcon/scripts/htmls/VAULT"

if [ ! -f "$PATHDIRHOME/.falcon_fly" ]; then
		echo -n "FALCON: current pathdir isn't a building site.  Proceed? [y/n] "
		read CHEK
		if [[ "$CHEK" = "y" ]]; then
			sudo touch $PATHDIRHOME/.falcon_fly
			sudo sh -c "echo \"new jsc bundle load\" >> $PATHDIRHOME/.falcon_fly"
			cd $PATHDIRHOME
			CHECKLOC=$( echo $PATHDIRHOME | cut -d"/" -f 1 )
			echo $CHECKLOC

			if [ ! -d "$PATHDIRHOME/jsc" ]; then
#			if [ ! -d "$PATHDIRHOME/jsc" ]; then

 				sudo cp $BIN $PATHDIRHOME
				sudo tar -jxvf $BIN/$JSCFILE
				/home/faron/.bin/ff.hl.css.glop
				/home/faron/.bin/ff.hl.js.glop
			fi
		else
			echo -n "FALCON: path of building site? "
			read PATHDIRHOME
			if [ "$PATHDIRHOME" != '' ]; then
					stopwatchtime
				else
					$0 $PATHDIRHOME
					stopwatchtime
			#	if [ -f "$PATHDIRHOME/.falcon_fly" ]; then
			#		cd $PATHDIRHOME
			#		echo "FALCON: current pathdir is a building site.  Ready to proceed"
			fi
		fi
	else
		echo "this is building site and all is set"
		if [ ! -d "$PATHDIRHOME/jsc" ]; then
 				sudo cp $BIN $PATHDIRHOME
				sudo tar -jxvf $PATHDIRHOME/$JSCFILE
				sudo rm "$PATHDIRHOME/$JSCFILE"
				/home/faron/.bin/ff.hl.css.glop
				/home/faron/.bin/ff.hl.js.glop
			fi
				#mkdir -p $PATHDIRHOME
				#cd $PATHDIRHOME
				#touch $PATHDIRHOME/.falcon_fly
				#echo "FALCON: initalizing pathdir as building site. Ready to proceed."
				# if [ ! -d jsc ]; then
 			# 		cp "$BIN/$JSCFILE" $PWD
				# 	tar -jxvf $JSCFILE
				# 	rm $JSCFILE
				# 	/home/faron/.bin/css.glop
				# 	/home/faron/.bin/js.glop
				# else
				# 	echo "FALCON: current pathdir is a building site.  Ready to proceed"
				# fi
	fi
		#fi
#else




#fi



# 		if [ -z "$PATHDIRHOME" ]; then
# 			echo -n "Name of project? "
# 			read PROJECTNAME
# 			PATHDIRHOME="/home/srv/htdocs/privs/$PROJECTNAME"
# 			mkdir -p $PATHDIRHOME
# 			touch $PATHDIRHOME/.falcon_fly
# 			if [ -f "$PATHDIRHOME/.falcon_fly" ]; then
# 				echo "FALCON: project initalized and ready to build"
# 			fi
# 		else
# 		    if [ -d "$PATHDIRHOME" ]; then
# 		    	if [ -f "$PATHDIRHOME/.falcon_fly" ]; then
# 		    		echo "FALCON: target path found and building site already enabled"
# 		    	else
# 		    		touch "$PATHDIRHOME/.falcon_fly"
# 		    		echo "FALCON: project initalized and ready to build"
# 				fi
# 			else
# 			 	mkdir -p "$PATHDIRHOME"
# 			 	touch "$PATHDIRHOME/.falcon_fly"
# 		    	echo "FALCON: project initalized and ready to build"
# 			fi
# 		fi
# else
# 		PATHDIRHOME="$PWD"
# 		if [ -f "$PATHDIRHOME/.falcon_fly"]; then
# 			echo "FALCON: project ready to build"
# 		fi
# fi
# # if [ -z "$1" ]; then
# # 		PATHDIRHOME="$PWD"
# # 	else
# # 		PATHDIRHOME="$1"
# # fi
# # if [ -z "$2" ]; then
# # 		echo -n "location of video clips (full path)? "
# # 		read VIDEOLOC
# # 	else
# # 		stopwatchtime
# # fi




# if [ -d "$BIN" ]; then
# 	echo "VALUT found"

# cd $PATHDIRHOME
# echo "Building site ready"
# fi

# # if [ -d "$PATHDIRHOME/jsc" ]; then
# 		echo "App structures match!"
# 	 	VIDEOGLOPPER=( $( find $VIDEOLOC -maxdepth 1 -type f -name '*.mp4' -name '*.webm' ! -name '*.mkv' -exec basename {} \; ) )



# 	 # 	if [[ ! -f "$PATHDIRHOME/jsc/css/bootstrap.min.css" ]]; then
# 		# 		getBootstrap
# 		# fi
# 	 # 	if [[ ! -f "$PATHDIRHOME/jsc/css/bootstrap-responsive.min.css" ]]; then
# 		# 		getBootstrap
# 		# fi
# 		# CLEANGLOP=( $( echo "${CSSGLOPPER[@]}" | sed '/cssengine/d' | sed '/ie6/d' | sed '/ie7/d' | sed '/ie8/d' | sed '/ie9/d' ) )
# 	 	# echo "@charset \"UTF-8\";" > $PATHDIRHOME/jsc/css/cssengine.css
# 		for b in "${VIDEOGLOPPER[@]}";
# 			do

# 			 	echo "$b"
# 	 		done
#  	# 	glopperGo
# 		# echo "FALCON: cssengine.css built"
# else
# 	  	echo "FALCON: This is not Faron-based project.  Aborting"
# 	  	stopwatchtime
# fi

/home/faron/.bin/ff.bin.chom
stopwatchtime


# if [ ! -d "$PATHDIRHOME/jsc" ]; then
#         JSCFILE="jsc-build.tar.bz2"
#         cp $BIN/$JSCFILE ./
#         tar -jxvf $JSCFILE
#         rm $JSCFILE -f
#         mkdir -p "$PATHDIRHOME/jsc/media"
#         mkdir -p "$PATHDIRHOME/jsc/cc"
#         mkdir -p "$PATHDIRHOME/jsc/htmls"
#         mkdir -p "$PATHDIRHOME/jsc/thumbs"
# fi

# echo -n "name of php file for showcasting? "
# read NAMEVIDEOFILE

# FILEGLOP=$( `find -L $VIDEOLOC -maxdepth 1 -type f -name '*.webm' -name '*.mp4' ! -name '*.mkv' -exec basename {} \;` )

# # if [ ! -d "$PATHDIRHOME/$VIDEOLOC" ]; then
# #     mkdir "$PATHDIRHOME/$VIDEOLOC"
# # fi

# # if [ ! -d "$PWD/$VIDEOLOC/$NAMEFOLDER" ]; then
# #     ln -s $VIDEOCLIPS $PWD/$VIDEOLOC/$NAMEFOLDER
# # fi
# # > a.list
# echo "${FILEGLOP[@]}"
# echo "$NAMEVIDEOFILE.php"
# # for f in "${FILEGLOP[@]}";
# # 	do
# # 		echo $f
# # 	#	cd $PATHDIRHOME/jsc/media
# # 	#	ln -s "$VIDEOLOC/$f"
# # 	done


# # #ls $VIDEOLOC/$NAMEFOLDER/*.mp4 >> a.list
# # while read line;
# #     do
# #         FILENAME="$( basename $line )"
# #         PREFILE="$( rev <<< "$FILENAME" | cut -d "." -f2 | rev )"
# #         FILELOC="$VIDEOLOC/$PREFILE.html"
# #         cp templatevideo.txt $FILELOC
# #         sed -i -e "s/~_PATH_~/$NAMEFOLDER\/$PREFILE/g" $FILELOC
# #     done < a.list
# #     cp templatedynamic.txt "$NAMEVIDEO.php"
# #     sed -i -e "s/~_PATHa_~/$VIDEOLOC\/$NAMEFOLDER/g" "$NAMEVIDEO.php"
# #     sed -i -e "s/~_PATHb_~/$VIDEOLOC/g" "$NAMEVIDEO.php"
#     stopwatchtime

