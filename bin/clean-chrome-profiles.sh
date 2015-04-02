#!/bin/bash
/usr/bin/find /home/faron/.local/share/applications/ -type f -name 'chrome-*' ! -name 'chrome-faron*' -exec rm {} \;

exit 0
