set -gx fish_greeting
set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
set -gx fifc_editor nvim

# PATH
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin
    case Linux
    case '*'
end
fish_add_path ~/dev/scripts
fish_add_path $HOME/.cargo/bin

# Aliases
## Ls
abbr l 'eza --icons'
abbr ll 'eza -l --icons'
abbr la 'eza -la --icons'
abbr ls 'eza --icons'
## Cd stuff
abbr cdf 'cd (fd -t d -d 8 | fzf)'
## Git
abbr g 'git'
abbr create-remote-repo 'gh repo create --source=. --private --push'
abbr vis 'gh repo view --json visibility -q .visibility'
## Copilot
abbr cpe 'gh copilot explain'
abbr cps 'gh copilot suggest'
### ChatGPT
abbr gpt 'chat --model gpt-4'
## Rust
abbr cg cargo
abbr fmt-all 'cargo +nightly fmt'
abbr re 'echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
## Tmux
abbr tka 'tmux kill-server'
abbr tls 'tmux ls'
abbr tm 'tmux'
## Tmuxp
abbr fux 'tmuxp load (tmuxp ls | fzf --layout=reverse --info=inline --height=40%)'
## Misc
abbr untar_command 'echo tar xvzf'
abbr nv 'nvim .'
abbr coffee_cow "cowsay \"It's coffee time\""

# Set environment variables
set -gx NVM_DIR "$HOME/.nvm"
if test -e $NVM_DIR
    source "$NVM_DIR/nvm.fish"
end

set -gx RUSTC_WRAPPER "$HOME/.cargo/bin/sccache"
set -gx RUST_BACKTRACE 1

set -gx PROTOC "/opt/homebrew/bin/protoc"

set -gx DISABLE_AUTO_TITLE 'true'


if status is-interactive
    # Set vi mode
    fish_vi_key_bindings

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search

    if command -sq zoxide
        zoxide init --cmd cd fish | source
    end

    fzf --fish | source
    atuin init fish --disable-ctrl-r | source # ctrl-r is for fzf fish history, and I want to keep it that way

    starship init fish | source
end

