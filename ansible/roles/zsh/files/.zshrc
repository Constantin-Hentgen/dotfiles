source ~/powerlevel10k/powerlevel10k.zsh-theme
source /home/constantin/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export LANG="en_US.utf8"
export PATH="$HOME/.poetry/bin:$PATH"

alias history="history 1"
alias t='sh -c "vi \$(fzf)"'

# Shortcuts for navigating directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git aliases
alias gs="git status"
alias gl="git log --oneline --graph --decorate --all"
alias gc="git commit -m"
alias ga="git add --all"
alias kali="podman run --privileged --cap-add=NET_RAW --cap-add=NET_ADMIN --env DISPLAY=$DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri -it kali-operational /bin/bash"

# keybinding for fzf (replacing CTR+R)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
