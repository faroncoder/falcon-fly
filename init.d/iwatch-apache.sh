#!/bin/sh
while inotifywait -e modify /var/log/syslog; do
  if tail -n1 /var/log/syslog | grep apache2; then
    kdialog --msgbox "Apache needs love!"
  fi
done