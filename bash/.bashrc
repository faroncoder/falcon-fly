   ##   ~/.bashrc: executed by bash(1) for non-login shells.
   ##   see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
   ##   for examples
   ##   If not running interactively, don't do anything
   case $- in
   *i*) ;;
   *) return;;
   esac
   ##   don't put duplicate lines or lines starting with space in the history.
   ##   See bash(1) for more options
   HISTCONTROL=ignoreboth
   ##   append to the history file, don't overwrite it
   shopt -s histappend
   ##   for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
   HISTSIZE=10000000
   HISTFILESIZE=20000000
   ##   check the window size after each command and, if necessary,
   ##   update the values of LINES and COLUMNS.
   shopt -s checkwinsize
   shopt -s globstar
   ##   If set, the pattern "**" used in a pathname expansion context will
   ##   match all files and zero or more directories and subdirectories.
   #shopt -s globstar
   export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
   ##   make less more friendly for non-text input files, see lesspipe(1)
   [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
   ##   set variable identifying the chroot you work in (used in the prompt below)
   #if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
   ##  debian_chroot=$(cat /etc/debian_chroot)
   #fi
   #####   THIS IS A WRAP TO ISOLATE THE CODES FROM THE RUNNING
   ###   SCRIPT.  THIS DOES NOT HAVE ANY BENEFIT FOR FARON'S CASE
   function forcecolorengine ()
   {
   ##   set a fancy prompt (non-color, unless we know we "want" color)
   case "$TERM" in
   xterm-color) color_prompt=yes;;
   esac
   ##   uncomment for a colored prompt, if the terminal has the capability; turned
   ##   off by default to not distract the user: the focus in a terminal window
   ##   should be on the output of commands, not on the prompt
   #force_color_prompt=yes
   if [ -n "$force_color_prompt" ]
   then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
   ##   We have color support; assume it's compliant with Ecma-48
   ##   (ISO/IEC-6429). (Lack of such support is extremely rare, and such
   ##   a case would tend to support setf rather than setaf.)
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
   ##   If this is an xterm set the title to user@host:dir
   #case "$TERM" in
   #xterm*|rxvt*)
   #PS1+="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   #;;
   #*)
   #;;
   #esac
   }


   function settingColors {
   ##   enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ];
    then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    fi
    ##   some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
   }

   function colorMotorOn {
	source "/home/faron/.falcon/bash/.bash_colors"
    last_command=$? ##   Must come first!
    PS1=""
    
    
    #PS1+="$white\$? "
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

##  ##   FARONIZED_COLOR
    LS_COLORS='di=1;35'
    export LS_COLORS

##  00  none — to restore default color
##   01  bold —  brighter colors
##   03  intalized
##   04  underscore —  underlined text
##   05  blink —  flashing text
##   07  reverse — to reverse background and foreground colors
##   08  concealed — to hide text
##   30  black foreeground
##   31  red foreground
##   32  green foreground
##   33  orange foreground
##   34  blue foreground
##   35  purple foreground
##   36  cyan foreground
##   37  gray foreground
##   38  gray foreground
##   41  red background
##   40  black background
##   42  green background
##   43  brown background
##   44  blue background
##   45  purple background
##   46  cyan background
##   47  gray background
##   90  dark gray
##   91  light red
##   92  light green
##   93  yellow
##   94  light blue
##   95  light purple
##   96  turquoise
##   97  white
##   100  dark gray background
##   101  light red background
##   102  light green background
##   103  yellow background
##   104  light blue background
##   105  light purple background
##   106  turquoise background
##   107  white background
   }

   ##   Add an "alert" alias for long running commands.  Use like so:
   ##    sleep 10; alert
#   alias alert="notify-send --urgency=low -i \"$([ \"$?\" = 0 ] && echo terminal || echo $error )\" \"$( history | tail -n 1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')\""
   ##   Alias definitions.
   ##   You may want to put all your additions into a separate file like
   ##   ~/.bash_aliases, instead of adding them here directly.
   ##   See /usr/share/doc/bash-doc/examples in the bash-doc package.


##   function loadScripts {
   ##   enable programmable completion features (you don't need to enable
   ##   this, if it's already enabled in /etc/bash.bashrc and /etc/profile
   ##   sources /etc/bash.bashrc).
  #  if [ ! "$( shopt -oq posix )" ]; then
#	if [ -f /usr/share/bash-completion/bash_completion ]; then

#		. /usr/share/bash-completion/bash_completion
#	fi
#	if [ -f /etc/bash_completion ]; then
#		. /etc/bash_completion
#0	fi
##  FARON-FILE : BASH_ALIASES
#    if [ ! -f ~/.bash_aliases ];
#    then
#  ln -s /home/faron/bin/core/data/bash/.bash_aliases ~/.bash_aliases
#  . ~/.bash_aliases
#    else
#  . ~/.bash_aliases
#    fi
##  FARON-FILE : BASH_SCRIPTS
#    if [ ! -f ~/.bash_scripts ];
#    then
#  ln -s /home/faron/bin/core/data/bash/.bash_scripts ~/.bash_scripts
#  . ~/.bash_scripts
#    else
#  . ~/.bash_scripts
#    fi
##  FARON-FILE : BASH_COLORS
#    if [ ! -f ~/.bash_colors ];
 #   then
#  ln -s /home/faron/bin/core/data/bash/.bash_colors ~/.bash_colors
#  . ~/.bash_colors
#    else
#  . ~/.bash_colors
#    fi
##  FARON-FILE : BASH_COLORS
    ##   if [ ! -f ~/.bash_colors_help ];
    ##    then
    ##   ln -s /home/faron/bin/core/data/bash/.bash_colors_help ~/.bash_colors_help
    ##   . ~/.bash_colors_help
    ##    else
    ##   . ~/.bash_colors_help
    ##   fi
##  FARON-FILE : BASH_TODO
##   if [[ "$EUID" == 1004 ]] || [[ "$EUID" == 1000 ]]; then
##	source /home/faron/.bash_aliases
##	source /home/faron/.bash_scripts
##	source /home/faron/.bash_todo
## fi



  #if [ -f ~/.bash_todo ];
   #then
    # . ~/.bash_todo
   #else
    # ln -s /home/faron/bin/core/data/bash/.bash_todo ~/.bash_todo
    # . ~/.bash_todo
  #fi
#fi
 #  }


   settingColors
  # forcecolorengine
	. ~/.bash_scripts
#	loadEnvironment
   colorMotorOn

