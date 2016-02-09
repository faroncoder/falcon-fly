export PATH=$PATH
	if [ -f "~/.bash_colors" ]; then
			source ~/.bash_colors
		else
			source ~/.bash_cache/.bash_colors
	fi
	if [ ! -f ~/.bash_scripts ]; then
		source ~/.bash_cache/.bash_scripts
	else
		source ~/.bash_scripts
	fi
	if [ -f ~/.bash_aliases ]; then
			source ~/.bash_aliases
		else
			source ~/.bash_cache/.bash_aliases
	fi
	if [ -f ~/.bash_todo ]; then
			source ~/.bash_todo
		else
			source ~/.bash_cache/.bash_todo
	fi
