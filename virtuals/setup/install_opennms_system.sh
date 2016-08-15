#!/bin/bash

sudo apt-get install default-mta
cat << EOF | sudo tee /etc/apt/sources.list.d/opennms.list
# contents of /etc/apt/sources.list.d/opennms.list
deb http://debian.opennms.org stable main
deb-src http://debian.opennms.org stable main
EOF

wget -O - http://debian.opennms.org/OPENNMS-GPG-KEY | sudo apt-key add -

ff.apt.update

ff.apt.fetch opennms

exit 0