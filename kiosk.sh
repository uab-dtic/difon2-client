#!/bin/bash
export DISPLAY=:0.0

xset s off
xset s noblank
xset dpms 0 0 0
xset -dpms


# Obtenim la interface de xaxa
INTER=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'`

# Obtenim la MAC address
MAC=`ip link show $INTER | awk '/link\/ether/ {print $2}'`

URL="https://difont.uab.cat/api/visor/$MAC"

chromium-browser --disable-session-crashed-bubble --disable-features=PreloadMediaEngagementData,AutoplayIgnoreWebAudio,MediaEngagementBypassAutoplayPolicies \
--noerrdialogs \
--disable-session-crashed-bubble \
--autoplay-policy=no-user-gesture-required \
--start-fullscreen \
--full-screen \
--kiosk \
--noerrdialogs \
--disable-notifications \
--disable-translate \
--no-first-run \
--disable-infobars \
--disable-features=TranslateUI \
--password-store=basic $URL &
