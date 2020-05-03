#!/bin/sh
xyzasdf=$( xinput | grep TrackPoint | cut -d'=' -f 2 | cut -d' ' -f 1 )
xyzasdf=$(echo -n ${xyzasdf:0:2})
xinput set-button-map $xyzasdf 1 0 3

xrandr --output eDP --scale 1.40x1.40
