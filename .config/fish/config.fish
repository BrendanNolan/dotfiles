set -g fish_greeting

fish_add_path ~/scripts
fish_add_path $HOME/.cargo/bin

# Aliases
alias l 'exa --icons'
alias ll 'exa -l --icons'
alias la 'exa -la --icons'
alias ls 'exa --icons'
alias create-remote-repo 'gh repo create --source=. --private --push'
alias fmt-all 'cargo +nightly fmt'
alias re 'echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
alias tka 'tmux kill-server'
alias tks 'tmux kill-session'
alias tls 'tmux ls'
alias tm 'tmux'
alias untar_command 'echo tar xvzf'
alias g 'git'
alias cf '/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nv 'nvim .'
alias nvimrc 'nvim ~/.config/nvim'
alias gpt 'python3 chatgpt-cli/chatgpt.py'

# For the fzf.fish Plugin
set fzf_preview_dir_cmd exa -l --icons 

# Set environment variables
set -x NVM_DIR "$HOME/.nvm"
[ -s "$NVM_DIR/nvm.fish" ]; and source "$NVM_DIR/nvm.fish"

if command -sq zoxide
    zoxide init fish | source
end

# Set vi mode
fish_vi_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
