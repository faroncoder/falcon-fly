export PATH=$PATH:$HOME/.bin
	if [ -f "$HOME/.bash_colors" ]; then
			source $HOME/.bash_colors
		else
			source $HOME/.bash_backup/.bash_colors
	fi
	if [ ! -f ~/.bash_scripts ]; then
		source ~/.bash_backup/.bash_scripts
	else
		source ~/.bash_scripts
	fi
	if [ -f ~/.bash_aliases ]; then
			source ~/.bash_aliases
		else
			source ~/.bash_backup/.bash_aliases
	fi
	if [ -f ~/.bash_todo ]; then
			source ~/.bash_todo
		else
			source ~/.bash_backup/.bash_todo
	fi
