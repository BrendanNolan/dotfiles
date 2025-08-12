## Ls
alias l 'eza --icons'
alias ll 'eza -l --icons'
alias la 'eza -la --icons'
alias ls 'eza --icons'
## Git
abbr --add g git
abbr --add ge 'git add . && git status && sleep 1 && git diff --cached'
abbr --add vis 'gh repo view --json visibility -q .visibility'
abbr --add bak 'git branch -D bak && git branch bak && git diff bak HEAD'
## Copilot
abbr --add cpe 'gh copilot explain'
abbr --add cps 'gh copilot suggest'
## Rust
abbr --add cg cargo
abbr --add re 'echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
## Tmux
abbr --add tka 'tmux kill-server'
abbr --add tls 'tmux ls'
abbr --add tm 'tmux'
## Misc
abbr nv 'nvim .'
## find hidden
abbr --add findh 'find . ! -path \'./.git/*\''
## grep hidden
abbr --add greph 'grep -rn --exclude-dir=\'.git\''
