#!/bin/bash

# APIKEY=55dbb1599d29b5e0657d2430e595faff
# LAT=-79.38
# LON=43.64
# URL="http://weathermap.org/data/2.5/weather?appid=$APIKEY&lon=$LAT&lat=$LON"

#curl --url http://api.openweathermap.org/data/2.5/weather?q&appid=55dbb1599d29b5e0657d2430e595faff&lon=-79.38&lat=43.64 -s
curl http://openweathermap.org/data/2.5/find?lat=$LAT&lon=$LON&appid=55dbb1599d29b5e0657d2430e595faff


# echo $LOAD

# TEMP=`echo $LOAD | jq .main.temp`
# CAL=`node -pe $TEMP-273.15`

# export TEMP=$CAL
# echo "$CAL"

exit 0

