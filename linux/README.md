#### To Fix emoji problems in arch linux
Install `ttf-twemoji-color` and setup the symlink as instructed in the post-install text  
You can check if you have BitStream font installed by using
```sh
fc-list | grep itstr
```
That shall take care of emoji in Firefox  
For chrome, install `noto-fonts-emoji`

Also, I recommend installing `noto-fonts` for common Indian languages

#### FOR ARCH LINUX USERS
`fbrokendesktop` is a script available in the AUR. Use it do find out and remove broken desktop-entry links  
`screenkey` is useful for displaying the typed key in screencasts  
`mycli` is a better mysql cli client (with autocomplete!)

</br>

#### Add the following lines to `/etc/profile`
```sh
# Needed for polybar
export HWMON_PATH="/sys/class/hwmon/hwmon$(for i in /sys/class/hwmon/hwmon*/temp*_input;do echo \"$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)\";done|grep Tdie |grep -o 'hwmon[1-9]' | grep -o '[1-9]')/temp2_input"
```

</br>

#### To setup neovim virtualenv:
```zsh
mkdir ~/.config/nvim/venv
cd ~/.config/nvim/venv
python -m venv .
source ~/.config/nvim/venv/bin/activate   # Or, if u have copied the .zshrc, u can simply run nvimvenv
pip install pynvim jedi
```
   * Run `which python`
   * Copy the output
   * at the topmost of your `init.vim` define `let g:python3_host_prog` with the copied value, e.g. `g:python3_host_prog = '/home/subhaditya/.config/nvim/venv/bin/python'`
   * install any required modules (e.g. jedi, mypy, etc)
   * `deactivate`

To install any module anytime, run `nvimvenv`, do the `pip install` whatever, then `deactivate`

</br>

### NOTE: The guide written below is TOTALLY outdated. Proceed at your own risk.


NOTE: A 256-colour terminal is recommended. On Windows, you may use [Terminus](https://eugeny.github.io/terminus/)

1. Install zsh
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
3. Install [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
4. Run powerlevel10k and choose some random config
5. Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
6. copy the .p10k.zsh and .zshrc files from this repo's home folder to ~ (i.e. home)
7. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
8. Install [fzf](https://github.com/junegunn/fzf)
9. Install [pyenv](https://github.com/pyenv/pyenv#basic-github-checkout)
10. Install [bat](https://github.com/sharkdp/bat#installation)
11. Install [fd](https://github.com/sharkdp/fd#installation)
12. Install [colorls](https://github.com/athityakumar/colorls)
13. Install [fusuma](https://github.com/iberianpig/fusuma)
14. Install colordiff

For runnning cowsays.sh:
Install fortune, cowsay, lolcat

Run my_sleep_time_adder.py to patch powerlevel10k. Undo the patches everytime you wanna update (pull), then reapply the patch

# A few tips:
### Pyenv:
```
pyenv shell $( pyenv versions | fzf --tac --layout=reverse --height=40% )
pyenv shell $( pyenv versions | fzf --tac --layout=reverse --height=40% --margin=0 )
```

### better i3lock
```
i3lock -c 00000040 -k --pass-media-keys --pass-screen-keys  --radius 180 --ring-width 20 --linecolor 0
0000000 --ringcolor=ffffff --keyhlcolor=000000 --insidecolor=ffffff --indicator --ringwrongcolor ff2134 --separatorcolor 00000000 --ringvercolor 008cf7 --insidevercolor 008cf7 --insidewrongcolor ff2134 --pass-power-keys --refresh-rate=0.5 --bshlcolor=ff2134
```

### To run X programs (scrot, sxhkd, etc.) from tty:
1. From the X11 session, run: `xhost +si:localhost:USERNAME`
2. Then, from the tty, execute: `export DISPLAY=:0`
3. Try running any X11 program :wink:

### `/usr/bin/python3^M: bad interpreter: No such file or directory`
There are a few options:
* On Linux, install `dos2unix` and run it on the file
* On vim, save the file after running `:set fileformat=unix`
