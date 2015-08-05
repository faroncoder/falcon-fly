#!/bin/bash

WWWD=/home/www/html

sudo chown -R www-data:www-data $WWWD
sudo chmod -R 775 $WWWD

exit 0
