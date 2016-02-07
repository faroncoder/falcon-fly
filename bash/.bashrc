export PATH=$PATH:$HOME/.bin

if [ -f "$HOME/.bash_colors" ]; then
		source $HOME/.bash_colors
	else
		source $HOME/.bash_backup/.bash_colors
fi

if [ -f "$HOME/.bash_scripts" ]; then
		source $HOME/.bash_scripts
	else
		source $HOME/.bash_backup/.bash_scripts
fi


if [ -f "$HOME/.bash_colors" ]; then
		source $HOME/.bash_colors
	else
		source $HOME/.bash_backup/.bash_colors
fi


if [ -f "$HOME/.bash_aliases" ]; then
		source $HOME/.bash_aliases
	else
		source $HOME/.bash_backup/.bash_aliases
fi


if [ -f "$HOME/.bash_todo" ]; then
		source $HOME/.bash_todo
	else
		source $HOME/.bash_backup/.bash_todo
fi
