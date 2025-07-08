set -gx fish_greeting
set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
set -gx fifc_editor nvim

# Abbreviations/Aliases
## Ls
alias l 'eza --icons'
alias ll 'eza -l --icons'
alias la 'eza -la --icons'
alias ls 'eza --icons'
## Git
abbr --add g git
abbr --add ge 'git add . && git status && sleep 1 && git diff --cached'
abbr --add create-remote-repo 'gh repo create --source=. --private --push'
abbr --add vis 'gh repo view --json visibility -q .visibility'
## Copilot
abbr --add cpe 'gh copilot explain'
abbr --add cps 'gh copilot suggest'
## Rust
abbr --add cg cargo
abbr --add fmt-all 'cargo +nightly fmt'
abbr --add re 'echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
## Tmux
abbr --add tka 'tmux kill-server'
abbr --add tls 'tmux ls'
abbr --add tm 'tmux'
## Misc
abbr nv 'nvim .'

if status is-interactive
    # Set vi mode
    fish_vi_key_bindings

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search

    if command -sq zoxide
        zoxide init --cmd cd fish | source
    end

    fzf --fish | source
    # atuin init fish --disable-ctrl-r | source # ctrl-r is for fzf fish history, and I want to keep it that way

    starship init fish | source
end

