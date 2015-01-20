#!/bin/bash

find -type f -name '*tar.gz' -exec basename {} \; >> ~/tar.list
while read line
	do
		echo "$line" >> ~/tars-listings.list
		tar -tf $line >> ~/tars-listings.list
		echo "--------" >> ~/tars-listings.list
	done < ~/tar.list
rm ~/tar.list

exit 0


