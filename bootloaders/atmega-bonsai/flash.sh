#!/bin/bash
echo -n "Enter MAC ADDRESS>"
read mac
make clean
make osd EUI64_ADDRESS="$mac"
sudo make osd_isp
