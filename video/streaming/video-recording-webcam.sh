#!/bin/bash

ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -pix_fmt yuv420p -i /dev/video0 1.mkv

exit 0

