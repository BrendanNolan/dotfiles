set -g fish_greeting

fish_add_path ~/dev/scripts
fish_add_path $HOME/.cargo/bin

# Aliases
## Ls
alias l 'exa --icons'
alias ll 'exa -l --icons'
alias la 'exa -la --icons'
alias ls 'exa --icons'
## Git
alias g 'git'
alias create-remote-repo 'gh repo create --source=. --private --push'
alias vis 'gh repo view --json visibility -q .visibility'
alias cf '/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
## Copilot
alias cpe 'gh copilot explain'
alias cps 'gh copilot suggest'
### ChatGPT
alias gpt 'chat --model gpt-4'
## Rust
alias cg cargo
alias fmt-all 'cargo +nightly fmt'
alias re 'echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
## Tmux
alias tka 'tmux kill-server'
alias tls 'tmux ls'
alias tm 'tmux'
## Tmuxp
alias fux 'tmuxp load (tmuxp ls | fzf --layout=reverse --info=inline --height=40%)'
## Misc
alias untar_command 'echo tar xvzf'
alias nv 'nvim .'

# For the fzf.fish Plugin
set fzf_preview_dir_cmd exa -l --icons 

# Set environment variables
set -x NVM_DIR "$HOME/.nvm"
[ -s "$NVM_DIR/nvm.fish" ]; and source "$NVM_DIR/nvm.fish"

set -x RUSTC_WRAPPER "$HOME/.cargo/bin/sccache"

set -x PROTOC "/opt/homebrew/bin/protoc"

set -x DISABLE_AUTO_TITLE 'true'

# Zoxide Stuff
if command -sq zoxide
    zoxide init fish | source
end

# Set vi mode
fish_vi_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
