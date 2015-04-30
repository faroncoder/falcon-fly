#!/bin/bash

 dvgrab --noavc --format avi --guid 1 - | ffmpeg -deinterlace -re -f dv -i - -y -f mp4 -c:v libx264 -s 640x480 -preset ultrafast -crf 23.0 -pix_fmt yuv420p -tune zerolatency -qp 0 -c:a libfdk_aac -ab 128k hereitis.mp4

#dvgrab -format dv1 - | ffmpeg -deinterlace -f dv -i - -y -f mp4 -vcodec libx264 -s 600x400 -preset medium -crf 23.0 -pix_fmt yuv420p -tune zerolatency -preset ultrafast -qp 0 -acodec libfdk_aac -ab 128k timestamp.mp4 < /dev/null

exit 0

