set -gx fish_greeting
set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
set -gx fifc_editor nvim

# Aliases
## Ls
alias l 'eza --icons'
alias ll 'eza -l --icons'
alias la 'eza -la --icons'
alias ls 'eza --icons'
## Cd stuff
alias cdf 'cd (fd -t d -d 8 | fzf)'
## Git
alias g 'git'
alias ge 'git add . && git status && sleep 1 && git diff --cached'
alias create-remote-repo 'gh repo create --source=. --private --push'
alias vis 'gh repo view --json visibility -q .visibility'
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

