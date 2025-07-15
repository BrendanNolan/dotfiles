# Aliases
## Ls
alias l='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias ls='eza --icons'
## Cd stuff
alias cdf='cd $(fd -t d -d 8 | fzf)'
## Git
alias g='git'
alias ge='git add . && git status && sleep 1 && git diff --cached'
alias create-remote-repo='gh repo create --source=. --private --push'
alias vis='gh repo view --json visibility -q .visibility'
## Copilot
alias cpe='gh copilot explain'
alias cps='gh copilot suggest'
### ChatGPT
alias gpt='chat --model gpt-4'
## Rust
alias cg=cargo
alias fmt-all='cargo +nightly fmt'
## Tmux
alias tka='tmux kill-server'
alias tls='tmux ls'
alias tm='tmux'
## Tmuxp
alias fux='tmuxp load $(tmuxp ls | fzf --layout=reverse --info=inline --height=40%)'
## Misc
alias untar_command='echo tar xvzf'
alias nv='nvim .'
