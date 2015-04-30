#!/bin/bash
ls  > links.txt
> links.html
while read line
	do
	echo "<iframe src=\"./jsc/media/htmls/$line\" width=\"400\" height=\"285\"frameborder=\"0\" scrolling=\"no\"></iframe>" >> links.html
	done < links.txt
rm links.txt
exit 0