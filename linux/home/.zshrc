# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/subhaditya/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo fancy-ctrl-z zsh_reload taskwarrior virtualenv pyenv zsh-autosuggestions fzf wd z fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#	export EDITOR='vim'
# else
#	export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add Games to PATH
export PATH=/usr/games:$PATH

## fzf Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# colorls
export PATH="$PATH:/home/subhaditya/.gem/ruby/2.7.0/bin/"
alias ls="colorls"

# my_run_bat () { cat $1 | powershell.exe -Command "& {cmd.exe}" - }
# my_run_bat_2 () { cat $1 | powershell.exe -Command "& {cd c:; cmd.exe /Q}" - }
# my_run_bat_3 () { powershell.exe "cd c:; & \"$( wslpath -w $1)\"" }

my_run_bat_4 () {
	if [[ $* =~ (-h) || -z $* ]]
	then echo "Execute Windows Batch files from WSL

Usage: runbat [options] path
Options:
	-h or --help	Show this help window and exit

Executes the specified file at the C: drive.
If C: is unavailable, then executes at the CMD default (Windows) directory."
	return; fi
	powershell.exe "cd c:; & \"$( wslpath -w $1)\""
}

alias runbat=my_run_bat_4
alias gaav="git add --all --verbose"
alias gdh="git diff HEAD"
alias gdh1="git diff HEAD~1 HEAD"

my_diff () { colordiff -u $* | less }
alias diff=my_diff
alias la1="la -1"
yays () { yay -S $(yay -Ss $* | cut -d' ' --fields=1 | grep .  | fzf --multi) --needed }
yayss () { yay -Ss $* }
pacs () { sudo pacman -S $(pacman -Ss $* | cut -d' ' --fields=1 | grep . | cut --fields=2 -d'/' | fzf --multi) --needed }
pacr () { sudo pacman -R $(pacman -Q $* | cut --fields=2 -d'/' | fzf --multi |	cut --fields=1 -d' ') }
alias ydl=youtube-dl
alias pacss="pacman -Ss"
mycal () { while true; do tput civis;clear; cal; sleep $(( 24*60*60 - `date +%H`*60*60 - `date +%M`*60 - `date +%S` )); done }
emojiinputtool () { while true; do
	codepoints="$(jome -f cp -p U)"
	if [ $? -ne 0 ]; then
		exit 1
	fi
	xdotool key --delay 20 $codepoints
	done }

bindkey "^[" vi-cmd-mode

alias monitorsetuptool="echo mons"
alias datausage=vnstat
alias ":q"=exit
alias ":Q"=exit
alias "cd.."="cd .."

vpn () { protonvpn $* && return true; echo "Running as root ..."; sudo protonvpn $* }
vimman () { man $* | vim - }
nvimman () { man $* | nvim - }

export EDITOR=nvim
export PATH=/home/subhaditya/.local/bin:$PATH

#pyenv global $(for x in $(pyenv version | cut -f1 -d' '); do echo -n "$x "; done)
pyenv global system pypy3.6-7.3.1
export PATH=/home/subhaditya/Notes/:$PATH
alias notes=notes.sh

if [[ -z $DISPLAY ]]; then export DISPLAY=:0; fi
my_man () { if [[ $* = 'z' ]] ; then sh -c "man ~/.oh-my-zsh/plugins/z/z.1"; else sh -c "man $*"; fi }
alias man=my_man
export PATH=./:$PATH

alias cameradisable="sudo chmod -r /dev/video*"
alias cameraenable="sudo chmod ug+r /dev/video*"
alias camerastatus="l /dev/video*"


if ! [[ -z $MY_NVIM_BG ]] && [[ $KITTY_WINDOW_ID -eq 1 ]]
	then echo 'if [[ $MY_NVIM_BG == "light" ]];then export MY_NVIM_BG="dark"; alias colorls="colorls"; export BAT_THEME="gruvbox (Dark) (Hard)"; fi' > ~/.config/kitty/custom_zsh_source
fi


# get_theme () {
# 	if my_variable_for_color=$(kitty @ get-colors)
# 	then
# 		if [[ $( echo $my_variable_for_color | grep color0 | cut -d'#' -f2) = '000000' ]]
# 		then
# 			export MY_NVIM_BG='light'
# 			echo 'if [[ $MY_NVIM_BG == "dark" ]];then export MY_NVIM_BG="light"; fi' > ~/.config/kitty/custom_zsh_source
# 		else
# 			export MY_NVIM_BG='dark'
# 			echo > ~/.config/kitty/custom_zsh_source
# 		fi
# 	fi
# }
get_theme () { source ~/.config/kitty/custom_zsh_source }
if ! [[ -z $MY_NVIM_BG ]]; then source ~/.config/kitty/custom_zsh_source; fi

toggle_theme () {
	get_theme
	if [[ $MY_NVIM_BG == 'dark' ]]
	then export MY_NVIM_BG='light'
		kitty @ set-colors -a -c ~/.config/kitty/gruvbox_light_hard.conf
		alias colorls="colorls --light"
		export BAT_THEME="gruvbox (Light) (Hard)"
		echo 'if [[ $MY_NVIM_BG == "dark" ]];then export MY_NVIM_BG="light"; alias colorls="colorls --light"; export BAT_THEME="gruvbox (Light) (Hard)"; fi' > ~/.config/kitty/custom_zsh_source
	else if [[ $MY_NVIM_BG == 'light' ]]
	then export MY_NVIM_BG='dark'
		kitty @ set-colors -a -c ~/.config/kitty/gruvbox_dark_hard.conf
		alias colorls="colorls"
		export BAT_THEME="gruvbox (Dark) (Hard)"
		echo 'if [[ $MY_NVIM_BG == "light" ]];then export MY_NVIM_BG="dark"; alias colorls="colorls"; export BAT_THEME="gruvbox (Dark) (Hard)"; fi' > ~/.config/kitty/custom_zsh_source
	fi
	fi
	echo -n "get_theme\n" | kitty @ send-text -t="title:subhaditya@EndeavourPad" --stdin
}

alias to=toggle_theme
alias py=python
export PYTHONSTARTUP=~/.pythonrc

alias gcm=
alias gcma=
my_gcm () { git commit -m "$*" }
my_gcma () { git commit --amend -m "$*" }
alias gcm=my_gcm
alias gcma=my_gcma
alias gpull="git pull"

alias icat="kitty +kitten icat"
alias qr="qrencode -t UTF8"
alias nvimvenv="source ~/.config/nvim/venv/bin/activate"
alias nvim="PATH='/home/subhaditya/.config/nvim/venv/bin':\$PATH nvim"

alias theme_light="gsettings set org.gnome.desktop.interface gtk-theme Layan-light && gsettings set org.gnome.desktop.interface icon-theme Tela-blue"
alias theme_dark="gsettings set org.gnome.desktop.interface gtk-theme Layan-dark && gsettings set org.gnome.desktop.interface icon-theme Tela-blue-dark"

