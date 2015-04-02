#!/bin/bash
FIL="$1"
ln -s "$PWD/$1" "$HOME/bin/$1"
rename 's/.sh//g' $HOME/bin/$1
exit 0
