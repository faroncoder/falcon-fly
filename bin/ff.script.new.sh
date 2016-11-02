#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
####################BEGIN
# WATCH=$@

HEADER="#!/bin/bash
if [[ ! \"\$( echo \$PATH | grep '/usr/local/bin' )\" ]]; then export PATH=\$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . \$LDD/colors; . \$LDD/functions; startTime
#################### BEGIN
"
FOOTER="################### END
$LANDHOME
doneTime ### [ FILE:\$MEF ACTIVE:y ]
"
NEWBODY=" your script goes here
echo \"\${_stat}\"; echo \"\${_no}\"; echo \"\${_warn}\";
echo \"\${_info}\"; echo\"\${_ok}\"
"
interactive=$3
scriptUpdaerEngine(){
#	`ff.script.kill --update`
	cd /tmp
	find . -maxdepth 1 -type d -name '*discharge*' -exec cd {} 1> /dev/null \;
	find . -maxdepth 1 -type d -name '*discharge*' -exec cd 1> /dev/null \;
	echo HOMDI=$PWD/booklet
	mkdir -p $HOMDI
	find $PWD -type d ! -empty -exec mkdir -p $HOMDI/{} \;
	find . -type f -name='*.sh' ! -path '*/kills/*'  ! -path '*/newbooklet/*' ! -path '*/.git/*'  >> $HOMDI/ref
	COUNT=
	while read line; do
		echo $line
		COUNT=`echo $(( $COUNT + 1 ))`
		MEF="$HOMDI/$line"
		cat "$HEADER" | sed '/^$/d' > "$MEF"
		cat $line | awk '/BEGIN/,/END/' | sed '/BEGIN/d' | sed '/END/d' >> "$MEF"
		cat "$FOOTER" | sed '/^$/d' >> "$MEF"
		chmod +x $MEF
		FILE=`basename $line`
		echo "${_warn} $COUNT of $GEF "
		if [[ -f "$MEF" ]]; then
			echo "${_ok} : $FILE "
		fi
	done <  $HOMDI/ref
}
finalRun(){
	ff.load
	SERVER=`hostname -s`
	if [[ "$SERVER" == "f8" ]]; then
		EDIT="subl"
	else
		EDIT="nano"
	fi
}

arumentsInstall(){
	echo -n "${_info} Script response when no arguments is entered?  "
	read Descript
	LOADDes="$Descript"
	INTERACT="if [[ \"\$1\" != \"\" ]]; then"
	ENDINTERACT="else echo \"\${_no} \$Fred no argument is supplied.\$Foff\""
	LOADIN="echo \"\${_info} \$Fyellow `echo $LOADDes` as an argument \$Foff\"; fi"
}
newProcess(){
	if [[ -f "$MEF" ]]; then
		echo "${_warn} filename exists."
		doneTime
	else
		> $MEF
		chmod +x $MEF
		cat "$HEADER" | sed '/^$/d' > "$MEF"
		cat  "$NEWBODY" >> "$MEF"
		cat "$FOOTER" | sed '/^$/d' >> "$MEF"
		echo "${_stat} $FBgreen $XF $Foff created!"
	fi
	finalRun
}
newScripter(){
	if [[ "$1" == "" ]]; then
		echo -n "${_info} script name? "
		read CL
	fi
	if [[ "$2" == "" ]]; then
		echo -n "${_info} folder? "
		read xcs
	fi
	if  [[ "$interactive" == "" ]]; then
		echo -n "${_warn} script to interact with user? (y=yes) "
		read interactive
		if [[ "$interactive" == "y" ]]; then
			arumentsInstall
		elif [[ "$interactive" == "" ]]; then
			INTERACT=""
			ENDINTERACT=""
			LOADIN=""

		elif [[ "$interactive" == "n" ]]; then
			INTERACT=""
			ENDINTERACT=""
			LOADIN=""
		fi
		LANDHOME="cd  \$RETURN 1> /dev/null 2> /dev/null;"
		FALCON="/home/users/faron/.falcon/scripts"
		XF="$( echo $CL | tr '  ' ' ' | sed 's/.sh//g' ).sh"
		MEF="$FALCON/$2/$XF"
		jj=$( uuid );
		ji=`printf $jj | cut -d '-' -f 4`
		KIL="$LYH/kills/$ji-killed-$XF"
	fi
	newProcess
}





tester(){
	echo ${_ok}
}

while :
do
SELECT="$@"
echo -n "${_info}  $Fyellow -u$Foff upgrader and $Fgreenany key$Foff for new script  "
 	case "$SELECT" in
 		-u) scriptUpdaerEngine;  break ;;
		--help) tester; break ;;
		*)  newScripter; break ;;
	esac
done
################### END
doneTime
### [FILE] ff.script.kill.sh  [ACTIVE] y
