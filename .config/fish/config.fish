set -g fish_greeting

set -x PATH $PATH ~/scripts

. "$HOME/.cargo/env"

# Aliases
alias ll 'ls -alF'
alias la 'ls -A'
alias l 'ls -CF'
alias create-remote-repo 'gh repo create --source=. --private --push'
alias fmt-all 'cargo +nightly fmt'
alias re 'echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy ; echo "Checking git status..." ; git status'
alias tka 'tmux kill-server'
alias tks 'tmux kill-session'
alias tls 'tmux ls'
alias tm 'tmux'
alias untar_command 'echo tar xvzf'
alias g 'git'
alias config '/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nv 'nvim .'
alias nvimrc 'nvim ~/.config/nvim'

# Set environment variables
set -x NVM_DIR "$HOME/.nvm"
[ -s "$NVM_DIR/nvm.fish" ]; and source "$NVM_DIR/nvm.fish"
[ -s "$NVM_DIR/bash_completion" ]; and source "$NVM_DIR/bash_completion"

if command -sq zoxide
    zoxide init fish | source
end

# Set vi mode
set -o vi

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
