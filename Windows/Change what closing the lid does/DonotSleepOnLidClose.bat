REM Do not sleep when lid is closed
@echo off

REM set lid action
powercfg /setacvalueindex scheme_current sub_buttons lidaction 0
powercfg /setdcvalueindex scheme_current sub_buttons lidaction 0

REM update current profile immediately
powercfg /setactive scheme_current

REM The last value indicates what is to be done on lid_close
REM 0 => Do nothing
REM 1 => Sleep
REM 2 => Hibernate
REM 3 => Shut down
