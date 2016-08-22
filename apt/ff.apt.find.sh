#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
x=( colors functions ); for z in "${x[@]}"; do source /usr/local/lib/faron_falcon/$z; done
if [[ "$1" != "" ]]; then
#################### BEGIN

<<<<<<< HEAD
GETPACK=''
KEYWORD="$@"

while :
	do
	case "$1" in
		$1)
			GETPACK=( $GETPACK $1 )
			if [ "$2" = '' ]; then
				break
			else
				shift
			fi
		;;
	esac
done

THISFUILE="/tmp/$( uuid )"

if [[ "$KEYWORD" == "" ]]; then
		echo -e "$Fno -- exiting"
		XeF
elif [[ "$KEYWORD" == " " ]]; then
		echo -e "$Fno -- exiting"
		XeF
fi

	if [[ ! -z "$2" ]]; then
			apt-cache search $1 | grep "$2" > $THISFUILE
#			echo $KEYWORD >> $THISFUILE
	elif [[ ! -z "$3" ]]; then
			apt-cache search $1 | grep "$2" | grep "$3"  > $THISFUILE
#			echo $KEYWORD >> $THISFUILE
	else
			apt-cache search $1  > $THISFUILE
#		 	KEYWORD="$1"
fi

makelister(){
		echo -e "$Fyellow ### $Foff PACKAGES LISTING $Fyellow####$Foff"
		NUMB=$( cat $THISFUILE | wc -l )
		if [[ "$NUMB" == 0 ]]; then
			exit 0
		fi
		N=0
		while read line; do
			N=$( echo $(( $N + 1 )) )
			NAMEPF="`echo $line | awk '{print $1}'`"
			DESPPF="`echo $line | awk '{$1= ""; print $0}'`"
			echo -e "$Fred$N $Fgreen$NAMEPF$Fyellow$DESPPF$Foff"
		done < $THISFUILE
		echo "-----"
		echo -e "Packages found:$Fblue $NUMB $Foff"
}


pickProcesser(){

echo -e "$Finfo Keyword searched: $Fred $KEYWORD $Foff"
	echo -n -e "Item to install ? "
	#read -s -N 1 SELECT
	read  PICK



if [[ "${PICK[@]}" == "" ]] || [[ "${PICK[@]}" == " " ]]; then
		echo -e "$Fno -- exiting"
		XeF
else

PICKS=( $( echo ${PICK[@]} ) )


G=0
F=0
	for pickme in "${PICKS[@]}"; do
		if [[ $F == 0 ]]; then FO="---"; fi
		WHOME="`awk "NR==$pickme" $THISFUILE | awk '{ print $1 }' `"

		echo -e "$Finfo fetching $Fteal$WHOME$Foff";
		ff.apt.fetch $WHOME
		echo "----------------------------------------------------"
		DPKG=`dpkg -l | grep -w "$WHOME" | awk '{ print $2 }'`
			if [[ "$DPKG" == "$WHOME" ]]; then
			G="`echo $(( $G + 1 ))`"
			echo -e "[ $Fgreen INSTALLED$Foff ] $Fyellow $WHOME $Foff | Installed:$Fgreen$G$Foff | Not installed:$Fred$FO$Foff"
		else
			F=`echo $(( $F + 1 ))`
			echo -e "[$Fred NOT INSTALLED$Foff ] $WHOME | $Fyellow Installed: $Fgreen$G$Foff | $Fyellow Not installed:$Fred$FO$Foff"

			fi
		pickme=""
		WHOME=""
	done
fi

menuEngine
}

checkList(){
if [[ $G == $NUMB ]]; then
	echo -e -n "$Fstat New search keyword: "
	read NEWSEARCH
	ff.apt.find `echo $NEWSEARCH`
	XeF
fi
}

menuEngine(){
	checkList
	makelister
	pickProcesser
}

menuEngine
=======
HERE="$1";
LOCA="/home/users/faron/.falcon/apts";

## get all queries and find one if id 
## was passed via this script.  
## then use the id as reading marker 
## if the file exists
find $LOCA/ -type f -wholename "$HERE" -exec THISFUILE={} \;

## but if there wasn't any find in search
## we will assign this new search
## and run the search. 
if [[ $THISFUILE == "" ]]; then
		NEWID=`cat /dev/urandom | tr -dc "A-Za-z0-9" | fold -w 32 | head -n 1`
		THISFUILE="$LOCA/$NEWID"
#	|		## get the whole broad search of name
#	|		## then 2nd argument would be distinive 
#	|		## string to narrow down the results.
			if [[ ! -z "$2" ]]; then
					`apt-cache search $HERE | grep $2 > $THISFUILE`
					echo "$( hostname -s):$HERE $2" >> $THISFUILE
#	|		## if there is 3rd argument, then use it again to narrow
#	|		## down against the current pool of results.
			elif [[ ! -z "$3" ]]; then
					`apt-cache search $HERE | grep $2 | grep $3  > $THISFUILE`
#	|				## this captures the key word used for this
#	|				## query and tag them as keyword and patch it
#	|				## on the query pull for easy find
					## specifically on the last line of the record
					echo "$( hostname -s):$HERE $2 $3" >> $THISFUILE;
			else
					`apt-cache search $HERE  > $THISFUILE`
					echo "$( hostname -s):$HERE" >> $THISFUILE;
			fi
	
##but if do this instead in case we DO have the 
##query record.  If there is record, push the id in
##variable for the query read

fi

## Grab contents from last line of the record and 
## retrieve it and re-use the same record to show
## instead of pull via internet which consume bandwidth
## and less the unnecessary usage
KEYWORD=`cat $THISFUILE | tail -n 1 | cut -d':' -f2`
## reload keywords 

NUMB=`cat $THISFUILE | head -n -1 | wc -l`
## count packages from the record
queryRun(){
	if [[ "$NUMB" == 0 ]]; then
		## if there are anything -- 
		## au reviour, then!
			exit 0
	fi
		# otherwise lets do the query read
		## during read - trim the last line
		## since we dont need that tag anymore
		## dump the results
		BLOG=`cat $THISFUILE | head -n -1`
		N=0
			while read line; do
				##counter reset
				N=`echo $(( $N + 1 ))`
				## for each line read, pull first column
				## as an identifier name for package queried
				NAME="`echo $line | sed  's/\s.*$//'`"
				## remove the package and load in variable
				## toggle font red as counter
				DEP="` echo $line | sed "s/$NAME//g" `"
				## toggle yellow as name of the package
				echo -e "$Fred$N $Fyellow$NAME$Foff$DEP"
				## toggle off and load the remaining variable
				## description for display
				## the whole boring stuff being
				## dumped.
			done << EOF
			$BLOG
EOF
			## after the dump, we append the footer section		
			echo "-----"
			## statistic on how many packages listed in this record
			## toggle blue. reuse data from earlier 
			## process when it counted the lines 	
			echo -e "Packages found:$Fblue $NUMB $Foff"
			## toggle red.  reuse data from earlier when 
			## we loaded from grabbing the tag off the last line
			echo -e "$Fstat Keyword searched: $Fred $KEYWORD $Foff"
			## now we have done the heck of job, so, which
			## package do user wish to install -
			## given that the selection will be in number 
			## according to the count earlier that matches
			## package name you wish to fetch
			echo -n -e "Item to install ? "
			## let's see what user input entered
			read ITEM
				## user is fininished with the query
				## because 'return' is hit showing no 
				## package is seleted from the query
				if [[ "$ITEM" == "" ]]; then
					## au reviour, user
					exit 0
					## oh, huh -- we do have selections to work
				else
					## we ignore any space bars or return as empty
					while [[ "$ITEM" != $"\x0a" && "$ITEM" != $"\x20" ]]; do
					case "$ITEM" in
						## let's go in loop for each selection
						$ITEM)
							## in case user picked a package by number
							## we use this number to fetch package
							for itemgrab in "${ITEM[@]}"; do
								## we match number against to number of line of that package
								ff.apt.fetch $( awk "NR==$itemgrab" $THISFUILE | awk '{ print $1 }' );
							done
							## ok we are done...unless we have more in queue
							shift 1
							## when we are done with number(s)
							break
							;;
						# if no more number, exit the loop
						*) 	
							break
							;;
					esac
				## Lone Ranger: "Hi-yo, Silver!" *neighting*
				done
fi

}
queryRun




$0 $HERE 
>>>>>>> 84896e1352a91461b3a324e1c2a7475758bfb568

################### END
#cd $RETURN 1> /dev/null;
else echo -e $Finfo "$Fyellow enter keyword to search the repository $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

