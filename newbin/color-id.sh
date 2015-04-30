#!/bin/bash

for i in {1..100}
	do
 		# your-unix-command-here
 		LS_COLORS="di=1;$i"
 		export LS_COLORS;
 		ls;
	done
# ME=
# LS_COLORS="di=1;$ME"
# export LS_COLORS;


# ls




exit 0

