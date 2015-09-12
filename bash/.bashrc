   case $- in
   *i*) ;;
   *) return;;
   esac
   HISTCONTROL=ignoreboth
   shopt -s histappend
   HISTSIZE=10000000
   HISTFILESIZE=20000000
   shopt -s checkwinsize
   shopt -s globstar
   export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
   [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
   function forcecolorengine ()
   {
   case "$TERM" in
   xterm-color) color_prompt=yes;;
   esac
   if [ -n "$force_color_prompt" ]
   then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
   color_prompt=yes
   else
   color_prompt=
   fi
   fi
   if [ "$color_prompt" = "yes" ]; then
   PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
   else
   PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
   fi
   if [ "$color_prompt"="yes" ]; then
   PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
   else
   PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
   fi
   unset color_prompt force_color_prompt
   }


   function settingColors {
    if [ -x /usr/bin/dircolors ];
    then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    fi
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
   }

   function colorMotorOn {
	source "/home/faron/.falcon/bash/.bash_colors"
    last_command=$? ##   Must come first!
    PS1=""
    if [[ "$last_command" == 0 ]];
    then
        PS1+="$Green_SHELL$checkmark_SHELL "
    else
        PS1+="$Red_SHELL$fancyX_SHELL "
    fi
    if [[ "$EUID" == 0 ]];
        then
            PS1+="$BRed_SHELL\\h "
        else
            PS1+="$BBlue_SHELL\\h "
    fi
    PS1+="$IPurple_SHELL\\w $reset_SHELL $ "

    LS_COLORS='di=1;35'
    export LS_COLORS

   }
   settingColors
. ~/.bash_scripts
   colorMotorOn
