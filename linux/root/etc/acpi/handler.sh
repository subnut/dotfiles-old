#!/bin/bash
# Default acpi script that takes an entry for all actions
# DONOT set noexpandtab
# it breaks the script
# the default vim options are already set in the very last line

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                zsh -c 'playerctl pause & ; if pgrep i3lock &> /dev/null; then true; else i3lock -c 00000040 -k --pass-media-keys --pass-screen-keys  --radius 180 --ring-width 20 --linecolor 00000000 --ringcolor=ffffff --keyhlcolor=000000 --insidecolor=ffffff --indicator --ringwrongcolor ff2134  --separatorcolor 00000000 --ringvercolor 008cf7 --insidevercolor 008cf7 --insidewrongcolor ff2134 --pass-power-keys --refresh-rate=0.5 --bshlcolor=ff2134 --datestr="%A, %d %b %Y" --redraw-thread; fi && systemctl suspend;'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged';
                        #sudo ifconfig enp2s0 down;
                        #logger 'Ethernet powered down'
                        ;;
                    00000001)
                        logger 'AC pluged';
                        #sudo ifconfig enp2s0 up;
                        #logger 'Ethernet powered on'
                        ;;
                esac
                ;;
            *)
                case "$4" in
                    00000000)
                        logger 'AC unpluged';
                        #sudo ifconfig enp2s0 down;
                        #logger 'Ethernet powered down'
                        ;;
                    00000001)
                        logger 'AC pluged';
                        #sudo ifconfig enp2s0 up;
                        #logger 'Ethernet powered on'
                        ;;
                    *)
                        logger "ACPI action undefined: $2"
                        ;;
            esac
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed';
                logger 'Starting sleep timer';
                sh -c 'sleep 5 && if pgrep i3lock &> /dev/null; then true; else i3lock -c 00000040 -k --pass-media-keys --pass-screen-keys  --radius 180 --ring-width 20 --linecolor 00000000 --ringcolor=ffffff --keyhlcolor=000000 --insidecolor=ffffff --indicator --ringwrongcolor ff2134  --separatorcolor 00000000 --ringvercolor 008cf7 --insidevercolor 008cf7 --insidewrongcolor ff2134 --pass-power-keys --refresh-rate=0.5 --bshlcolor=ff2134 --datestr="%A, %d %b %Y" --redraw-thread; fi && sleep 5m && logger "Sleep timer finished. Sleeping now ..." && ( playerctl pause; systemctl suspend ) # This is a comment_sleep_timer ' &
                ;;
            open)
                logger 'LID opened';
                kill $(pgrep --full "(This is a comment_sleep_timer)") && logger 'Sleep timer interrupted ...'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
        esac
        ;;
    video/brightnessdown)
        case "$2" in
            BRTDN)
                light -U 5
                ;;
        esac
        ;;
    video/brightnessup)
        case "$2" in
            BRTUP)
                light -A 5
                ;;
        esac
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
