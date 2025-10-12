source "${HOME}/.bash_profile"
eval "$(starship init bash)"
eval "$(fzf --bash)"
set -o vi
alias ti="tmux_init ${HOME}/dev/fave-tmux/tmux.json"

