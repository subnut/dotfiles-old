My dotfiles :)

P.S. Did you know? In Windows terminal, you can enable transparency! Just scroll while keeping Ctrl+Shift pressed

In ThinkPads, you can disable the middle ThinkPoint button completely, but still retain its scrolling functionality.
[See this unix.stackexchange.com post on how to do that.](https://unix.stackexchange.com/a/487975)  
Try adding this to a startup script to make the changes permanent (or if you are on Arch, use the script in this repo ;-) )   

A one-liner to show CPU frequency every second:` while sleep 1; do lscpu | grep "CPU MHz" | cut -c34-; done`  

Pro Tip: Run it and resize the window and keep it on top-left corner and configure KDE to Keep Above Others
You may also try using `watch`

Text wallpaper: [WordWall](https://github.com/tomocafe/wordwall)

In Firefox, goto `about:config` and set `network.IDN_show_punycode` to `true`  
To read about why this is nessecary, click [here](https://www.xudongz.com/blog/2017/idn-phishing/)

From WSL, to set LidCloseAction, use the following commands-  
```
cat ~/dotfiles/Windows/Change\ what\ closing\ the\ lid\ does/SleepOnLidClose.bat | powershell.exe -Command "& {cmd.exe}" -
```
```
cat ~/dotfiles/Windows/Change\ what\ closing\ the\ lid\ does/DonotSleepOnLidClose.bat | powershell.exe -Command "& {cmd.exe}" -
```

To select and delete multiple packages at once in Arch, use `sudo pacman -R $(pacman -Q | fzf --multi |  cut --fields=1 -d' ')`  
Choose multiple options using the `<TAB>` key  

The equivalent command for installing repo packages is `sudo pacman -S $(pacman -Ss | cut -d' ' --fields=1 | grep .  | fzf --multi) --needed`  

For AUR, just substitute `pacman` for `yay`  

To see daily/monthly data consupmtion, install `vnstat` and enable & start the service
```
systemctl enable vnstat
systemctl start vnstat
```
Check usage anytime with `vnstat`, no root required 😉

# In thinkpads, the PrtSc (PrintScreen) is the SysRq key
