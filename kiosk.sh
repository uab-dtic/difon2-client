#!/bin/bash
export DISPLAY=:0.0

URL=""

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
