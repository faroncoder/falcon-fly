#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

GETINPUTUID=$1
GETINPUTGROUPS=$2

if [[ "$GETINPUTUID" == "" ]]; then
	echo -n "$Finfo targeted UID? ($Fyellow default=$UID$Foff )? "
	read GETUID
else
	GETUID=$GETINPUTUID
fi



if [[ "$GETINPUTGROUPS" == "" ]]; then
	echo -n "$Finfo targeted GROUP ($Fyellow default=$GROUPS$Foff )? "
	read GETGROUPS
else
	GETGROUPS=$GETINPUTGROUPS
fi

OWNER="$GETUID:$GETGROUPS"

#CHECKDATA=/tmp/ff.file_permission_check.txt
LOADDATA="/tmp/`uuid`"
#> $CHECKDATA
> $LOADDATA
#GETALL=( `$SUDO find . -type f -exec ` )
$SUDO find . -type f >> $LOADDATA
$SUDO sed -i -e 's/ /\\ /g' $LOADDATA
TOTALCOUNT=`find . -type f | wc -l`
echo "$Fstat collecting file information" 2> /dev/null
echo "$Finfo Total of files in $Fteal$PWD$Foff: $Fyellow$TOTALCOUNT$Foff"
FILECOUNT=0
ISSUECOUNT=0
CLEANCOUNT=0
while read line; do 
	FILECOUNT=`echo $(( $FILECOUNT + 1 ))`
	ID=`uuid`
	TRIM=`echo $line | rev | cut -d'/' -f1 | rev`
 	find . -type f -name "*$TRIM*" -print0 | xargs -0 stat | sed '/Birth/d' | sed '/Change/d' | sed '/Modify/d' | sed '/Device/d' | sed '/Size/d'  | head -n 2 > /tmp/$ID
	GETFILE=`grep 'File' /tmp/$ID | cut -d":" -f2 | sed "s/'//g"`
	GETINFO=`find . -type f -name "*$TRIM*" -print0 | xargs -0 stat | sed '/Birth/d' | sed '/Change/d' | sed '/Modify/d' | sed '/Device/d' | sed '/Size/d'  | head -n 2 > /tmp/$ID; cat /tmp/$ID | sed 's/[A-Za-z]//g' | sed 's/(//g' | sed 's/)//g' | sed 's/\///g' | sed 's/://g' | sed 's/-//g' | awk '{ print $2":"$3" "$1 }' | tail -n 1` 
	CHMOD=`echo $GETINFO | awk '{ print $1 }'`
	if [[ "$CHMOD" == "$OWNER" ]]; then
		#FILEOK=( ${FILEOK[@]} $GETFILE )
		CLEANCOUNT=`echo $(( $CLEANCOUNT + 1 ))`
	else
		#echo "$Fno $GETFILE"
		ISSUENO=( ${ISSUENO[@]} $GETFILE )
		ISSUECOUNT=`echo $(( $ISSUECOUNT + 1 ))`
	fi
	/bin/rm /tmp/$ID
done <  $LOADDATA
/bin/rm $LOADDATA

echo "$Finfo$Fyellow Result --$Foff Files:$Fyellow$TOTALCOUNT$Foff Processed:$Fteal$FILECOUNT$Foff Issues:$Fred$ISSUECOUNT$Foff Intact:$Fgreen$CLEANCOUNT$Foff"
# if [[ "$ISSUECOUNT" != 0 ]]; then
# 	echo -n "$Finfo press l to list all files with issues (enter for nay)  "
# 	read LISTGO
# 	if [[ "$LISTGO" == "l" ]]; then
# 		for issueput in "${ISSUENO[@]}"; do	
# 			printf "$Fwarn $issueput"
# 		done
# 	fi	
# fi

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.check.permission.sh  [ACTIVE] y

