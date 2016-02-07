#!/bin/bash
export PATH=$PATH:/home/faron/.bin
sudo apt-get install -y apache2-dev

wget http://people.apache.org/~pquerna/modules/mod_flvx.c
sudo apxs -i -a -c mod_flvx.c 
rm mod_flvx.c
ff.apache2.restart

exit 0
