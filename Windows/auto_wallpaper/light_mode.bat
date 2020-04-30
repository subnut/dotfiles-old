REM light_mode
@echo off

reg add "HKCU\Control Panel\Desktop" /v WallPaper /t REG_SZ /d %USERPROFILE%\auto_wallpapers\light.png /f
reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v Theme /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 1 /f

REM refresh wallpaper
powershell "Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force; cd $HOME; .\auto_wallpapers\set_light_mode_wallpaper.ps1"