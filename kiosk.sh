#!/bin/bash
export DISPLAY=:0.0

xset s off
xset s noblank
xset dpms 0 0 0
xset -dpms


# Obtenim la MAC address
MAC=`ifconfig $INTER | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`

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
