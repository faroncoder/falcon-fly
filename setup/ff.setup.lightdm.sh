#!/bin/bash

sudo sh -c "echo \"
[SeatDefaults]
autologin-user=faron
autologin-user-timeout=0
user-session=ubuntu
greeter-session=unity-greeter
allow-guest=false
\" >> /etc/lightdm/lightdm.conf"

exit 0
