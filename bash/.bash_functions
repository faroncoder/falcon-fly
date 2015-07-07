function faroncolors {
    last_command=$? # Must come first!
    PS1=""
    reset='\[\e[00m\]'
    fancyX='\342\234\227'
    checkmark='\342\234\223'
    #PS1+="$white\$? "
        if [[ $last_command == 0 ]]; then
            PS1+="$Green$checkmark "
            else
                PS1+="$Red$fancyX "
            fi
        if [[ $EUID == 0 ]]; then
            PS1+="$Red\\h "
            else
                PS1+="$Purple\\u$White@$Purple\\h "
            fi
    PS1+="$Cyan\\w \\\$$reset "
}

function exportlibs {
    FARON_PATH="/home/faron/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/usr/games:/usr/local/games:/usr/share/bin:/usr/local/bin:/home/faron/bin/local/bin"
    export PATH="$PATH:$FARON_PATH"
    JAVA_HOME="/usr/local/share/java/jdk1.7.0_45"
    export PATH="$PATH:$JAVA_HOME/bin"
    JRE_HOME="/usr/local/share/java/jre1.8.0_25"
    export PATH="$PATH:$JRE_HOME/bin"
    FARON_ANDROID_SDK="/home/faron/lib/app/sdk"
    export PATH="$PATH:$FARON_ANDROID_SDK/bin"
    NODE_FARON="/usr/local/bin/node"
    export PATH="$PATH:$NODE_FARON"
    #ANDROID_NDK="/usr/local/share/ndk"
    #export PATH="$PATH:$ANDROID_NDK"
    #GOPATH="/home/local/go"
    #GOPATH="/usr/local/go"
    #export PATH="$PATH:$GOPATH/bin"
}


MEID=$( whoami )

if [ "$MEID"=="faron" ]
	then
		SSH_ENV=$HOME/.ssh/environment
		# start the ssh-agent
		function start_agent 
		    echo "Initializing new SSH agent..."
		    # spawn ssh-agent
		    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
		echo "succeeded"
    		chmod 600 "$SSH_ENV"
		. "$SSH_ENV" > /dev/null
		/usr/bin/ssh-add
fi


if [ -f "$SSH_ENV" ]; then
     . "$SSH_ENV" > /dev/null
     ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ > /dev/null || 
        start_agent;
    
else
    start_agent;
fi

######### FARONIZED-MENU CD + LS
function cd {
    builtin cd "$@"
    RET=$?
    ls
    return $RET
}

