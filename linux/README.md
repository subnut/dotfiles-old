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

For runnning cowsays.sh:
Install fortune, cowsay, lolcat

Included powerlevel10k/internal/p10k.zsh file has been patched to update the terminal prompt clock at the start of every minute

# A few tips:
### Pyenv:
`pyenv shell $( pyenv versions | fzf --tac )`
`pyenv install $( pyenv install -l | fzf --tac )`
