source "${HOME}/.bash_profile"
eval "$(starship init bash)"
eval "$(fzf --bash)"
set -o vi
alias g='git'
alias ta='tmux attach'
alias tl='tmux ls'
alias tk='tmux kill-server'
alias ti='tmux_init "${HOME}/dev/fave-tmux/tmux.json"'
