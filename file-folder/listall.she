#!/bin/bash
startgreen=`date`
#getfilesdir=( $( find . -maxdepth 1 -type d ! -type f | sed '/\./d' | sed '/\.\./d' | sort | cut -d "/" -f2 ) )
getfileslist=($( find ./ -maxdepth 1 -type f ! -name '.*' -exec basename {} \; | sort | sed 's/ //g' ))
getfilesdir=($( find ./ -maxdepth 1 -type d ! -name '.' ! -name '..' ! -name '.*' -exec basename {} \; | sort  | sed 's/ //g' ))



getall=($( printf "\e[0;33m$( echo ${getfilesdir[@]})\e[0m " )
       $( printf "\e[0;32m$( echo ${getfileslist[@]})\e[0m " )
      )

# column -t $getall
## for it in *; do echo $it; done | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";' | jq -C .
#printf "%-20s | %-20s | %-20s \n" $lsdir $lsdir $lsdir

# for lsdir in ${getfilesdir[@]}
# 	do
# 	getall( "$( echo \"\e[0;33m$lsdir\e[0m \" )" )
# 	 done

for lsfile in ${getfileslist[@]}
	do
	#getall( $( eval printf \"\e[0;32m${getfileslist[@]}\e[0m \" )
	printf "\e[0;32m$lsfile\e[0m" | column -s "\n" -t

	 done
#for final in ${getall[@]}

 # column -t `${getall[@]}`

# for lsfile in ${getfileslist[@]}
# 	do
# 	printf "\e[0;32m$lsfile\e[0m "
# 	done
# 	printf "\n"

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
