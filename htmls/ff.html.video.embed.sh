#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

LOC=$1
if [[ "$LOC" == "" ]]; then
	LOC=$PWD
fi

if [[ ! -d "$LOC/docs" ]]; then
	mkdir $LOC/docs
fi

GETFILES=( `find $LOC -maxdepth 1 -name '*.mp4' -exec basename {} \;` )

for file in "${GETFILES[@]}"; do
_FileMe=`echo $file | rev | cut -d'.' -f2 | rev`	
sudo sh -c "echo \"
<!DOCTYPE html>
	<head>
		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
		<title>$_FileMe</title>
		<style>
			body { background: black; }
			video { width:100%; height:100%; }
		</style>
	</head>
	<body>
		<video id=\"$_fileme\" controls=\"controls\">
			<source src=\"http://192.168.1.6:8800/$_FileMe.mp4\" type=\"video/mp4\">
			<! -- <track kind=\"captions\" src=\"http://192.168.1.6:8800/cc/$_fileme.vtt\" srclang=\"en\" ></track>  -->
				<p>Your browser leaves much to be desired.</p>
			</video>
		</body>
	</html>
\" > $PWD/docs/$_FileMe.html"

done

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.html.video.embed.sh  [ACTIVE] y

