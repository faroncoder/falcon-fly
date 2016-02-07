#!/bin/bash

cd $HOME
rm .profile .bashrc .bash_aliases .bash_scripts .bash_todo .bash_colors .bash_colors_help  2> /dev/null
CHECKHISTORY=$( find  $HOME -maxdepth 1 -type l -name '.bash_history' )
if [ -z "$CHECKHISTORY" ]; then
	cat "$HOME/.bash_history" >> "/media/falcon/archives/bash_history/$(hostname --short)_history"
	rm .bash_history & ln -s "/media/falcon/archives/bash_history/$(hostname --short)_history" "$HOME/.bash_history"
fi

mkdir $HOME/.bash_backup 2> /dev/null
find $HOME/.falcon/scripts/bash -type f -name '.*' -exec cp {} ~/.bash_backup/ \;
find $HOME/.falcon/scripts/bash -type f -name '.*' -exec ln -s {} \;
#find $HOME/.falcon/scripts/bash -maxdepth 1 -type f -name '.*' -exec ln -s {} \;
#tar -jxvf /home/fly/setup/packs/loadBash.tar.bz2
cp "/media/falcon/setup/customized_setup/vault/profile.txt" "$HOME/.profile"
source $HOME/.profile

exit 0