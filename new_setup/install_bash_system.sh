#!/bin/bash

cd $HOME
rm .profile .bashrc .bash_aliases .bash_scripts .bash_todo .bash_colors .bash_colors_help  2> /dev/null
CHECKHISTORY=$( find  $HOME -maxdepth 1 -type l -name '.bash_history' )
if [ -z "$CHECKHISTORY" ]; then
	cat "$HOME/.bash_history" >> "/mnt/falcon/archives/bash_history/$(hostname --short)_history"
	rm .bash_history & ln -s "/mnt/falcon/archives/bash_history/$(hostname --short)_history" "$HOME/.bash_history"
else
	CHECKLINK="$( ls -al $HOME/.bash_history | awk '{print $11}' )"
	if [[ "$CHECKLINK" = "/mnt/falcon/archives/bash_history/$(hostname --short)_history" ]]; then
		echo ".bash_history = ok"
	else
		rm .bash_history & ln -s "/mnt/falcon/archives/bash_history/$(hostname --short)_history" "$HOME/.bash_history"
		echo ".bash_history = repaired"
	fi
fi

mkdir $HOME/.bash_cache -p 2> /dev/null
find $HOME/.falcon/scripts/bash -type f -name '.*' -exec cp {} ~/.bash_cache/ \;
cp "/mnt/falcon/scripts/new_setup/vault/profile.txt" "$HOME/.profile"
echo ".profile install as master file at $HOME"
echo "Files copied as backup as alternative bash in case server goes down:"
find $HOME/.bash_cache -type f -name '.*' -exec basename {} \;
echo "Primary bash files linked to remote server:"
cd $HOME 2> /dev/null
find $HOME/.falcon/scripts/bash -maxdepth 1 -type f -name '.*' -exec ln -s {} \;
UPDATE=( $( find $HOME/.falcon/scripts/bash -maxdepth 1 -type f -name '.*' -exec basename {} \; ) )
for d in "${UPDATE[@]}"; do
	ls -al $d | awk '{print $9 $10 $11}'
done
`source ~/.profile`

exit 0
