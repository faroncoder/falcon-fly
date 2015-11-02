#!/bin/bash

WWWD=/srv/www/htdocs

sudo chown -R faron:www-data $WWWD
sudo chmod -R 665 $WWWD

exit 0
