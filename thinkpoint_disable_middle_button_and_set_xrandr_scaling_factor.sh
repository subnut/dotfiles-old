#!/bin/sh

echo "#!/bin/sh" >> /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
echo "xyzasdf=\$( xinput | grep TrackPoint | cut -d'=' -f 2 | cut -d' ' -f 1 )"  >> /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
echo "xyzasdf=\$(echo -n \${xyzasdf:0:2})"  >> /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
echo -n "xinput set-button-map "  >> /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
echo -n "\$xyzasdf" >> /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
echo " 1 0 3"  >> /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
echo "xrandr --output eDP --scale 1.40x1.40"  >> /home/subhaditya/.profile

chmod +x /etc/X11/xinit/xinitrc.d/101-trackpoint-middle-button.sh
 
