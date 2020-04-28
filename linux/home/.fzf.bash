# Setup fzf
# ---------
if [[ ! "$PATH" == */home/subhaditya/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/subhaditya/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/subhaditya/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/subhaditya/.fzf/shell/key-bindings.bash"
