#!/bin/bash
export PATH=$PATH:/usr/local/bin
#file=`uuid | sed 's/-//g'`
file=$( uuid | cut -d"-" -f1 )

#nohup `dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -y -c:v libx264 $preset ultrafast -pix_fmt yuv420p -crf 25.0 -tune zerolatency -qp 0 -g 60 -b:v 800k -maxrate 1024k -bufsize 800k -flags +global_header -c:a libfdk_aac -b:a 128k -ar 44100 -ac 2 -f mpeg "$MYHOME/$file.mpg" < /dev/null & sleep 3; ffplay "$MYHOME/$file.mpg"` > firewire-recording.out 2> firewire-recording.err < /dev/null &

#dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -y -vcodec libx264 -preset ultrafast -b:v 800k -maxrate 1024k -crf 25 -pix_fmt yuv420p -tune zerolatency -qp 0 -g 60 -flags +global_header -acodec libfdk_aac -b:a 128k -ar 44100 -ac 2 -f mpg "$MYHOME/$file.mpg" 1> dvrab.out 2> dvgrab.err < /dev/null;

#sleep 2; ffplay "$MYHOME/$file.mpeg"


#dvgrab -noavc -format avi -guid 1 - | ffmpeg -v error -re -f avi -i - -y -c:v libx264 -preset ultrafast -profile baseline -qp 0 -pix_fmt yuv420p -tune zerolatency -crf 25 -g 60 -maxrate 1024k -bufsize 1229k -c:a libmp3lame -b:a 128k -ar 44100 -ac 2 -f mpg "$MYHOME/$file.mpeg" < /dev/null

##OPTION 1 if not have libfk
<<<<<<< HEAD
dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -c:v libx264 -preset ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libmp3lame -b:a 128k -ar 44100 -ac 2 -f asf "$HOME/$file.avi"  > /dev/null;
=======
<<<<<<< HEAD
dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -c:v libx264 -preset ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libmp3lame -b:a 128k -ar 44100 -ac 2 -f asf "$HOME/$file.avi" < /dev/null && sleep 2; mpv "$HOME/$file.avi";
=======
dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -c:v libx264 -preset ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libmp3lame -b:a 128k -ar 44100 -ac 2 -f asf "$HOME/$file.avi"  > /dev/null;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

#dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -c:v libx264  -preset ultrafast -maxrate 1512k -bufsize 768k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libmp3lame -b:a 128k -ar 44100 -ac 2 -f asf "$HOME/$file.avi"

#dvgrab -noavc -format dv2 -opendml -lockstep  -guid 1 -timecode - | ffmpeg -re -i - -c:v libx265  -flags +loop -flags +global_header -acodec libmp3lame -b:a 128k -ar 44100 -ac 2 -f mpegts "$HOME/$file.ts"

#-preset ultrafast -maxrate 1512k -bufsize 768k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p#

##OPTION 2

#dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -vcodec libx264 -preset ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libfdk_aac -b:a 128k -ar 44100 -ac 2 -f asf $file.avi > /dev/null & sleep 2; ffplay $file.avi;


#dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -c:v libx264 -preset ultrafast -qp 0 -pix_fmt yuv420p -tune zerolatency -maxrate 1024k -bufsize 1024k -crf 24 -c:a libfdk_aac -ac 2 -ar 44100 -b:a 128k -f asf "$file.avi" > /dev/null & sleep 2; ffplay "$MYHOME/$file.avi";

exit 0


