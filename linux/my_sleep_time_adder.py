from os import path
with open(path.expandvars('$HOME/.oh-my-zsh/custom/themes/powerlevel10k/internal/p10k.zsh'),'r') as original:
    original_lines=original.readlines()
for cur_line in original_lines:
    if cur_line.find("sleep 1")!=-1: break
else: raise IndexError("The specified line (sleep 1) was not found") 
cur_index=original_lines.index(cur_line)
original_lines[cur_index]="""  my_sleep_time=$(( 60 - `date +S%`  ))
  sleep $my_sleep_time
"""
with open(path.expandvars('$HOME/.oh-my-zsh/custom/themes/powerlevel10k/internal/p10k.zsh'),'w') as new:
    new.writelines(original_lines)

