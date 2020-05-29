@echo off
REM Turn screen off when Power Button is pressed
echo Turn screen off when Power Button is pressed

REM set lid action
powercfg /setacvalueindex scheme_current sub_buttons pbuttonaction 4
powercfg /setdcvalueindex scheme_current sub_buttons pbuttonaction 4

REM update current profile immediately
powercfg /setactive scheme_current

REM The last value indicates what is to be done on lid_close
REM 0 => Do nothing
REM 1 => Sleep
REM 2 => Hibernate
REM 3 => Shut down
REM 4 => Turn off the display
