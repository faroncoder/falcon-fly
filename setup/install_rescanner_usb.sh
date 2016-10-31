#!/bin/bash
export PATH=$PATH:/usr/local/bin
ff.apt.fetch ff.apt.fetch libusb-1.0-0-dev libusb-1.0-0 libusb-1.0-0-doc libusb++-dev libusb-dev 2> /dev/null
sudo gcc - source /usr/bin/usb_rescanner $HOME/.falcon/scripts/setup/cc/compile_rescanner_usb.c -lusb
exit 0
