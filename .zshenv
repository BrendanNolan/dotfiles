# PATH
path=("$HOME/dev/scripts" "$HOME/.cargo/bin")
path=("${(u)path}") # Uniquify the path array
case "$(uname)" in
    Darwin) path+=(/opt/homebrew/bin /opt/homebrew/opt/gnu-sed/libexec/gnubin) ;;
    *) ;;
esac
export PATH

# OTHER ENV VARS
export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export RUST_BACKTRACE=1
export PROTOC=/opt/homebrew/bin/protoc
export DISABLE_AUTO_TITLE=true

# Aliases
## Ls
alias l='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias ls='eza --icons'
## Cd stuff
alias cdf='cd (fd -t d -d 8 | fzf)'
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
alias re='echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
## Tmux
alias tka='tmux kill-server'
alias tls='tmux ls'
alias tm='tmux'
## Tmuxp
alias fux='tmuxp load (tmuxp ls | fzf --layout=reverse --info=inline --height=40%)'
## Misc
alias untar_command='echo tar xvzf'
alias nv='nvim .'
alias coffee_cow='cowsay "It's coffee time"'
# Talon
alias talon_log="tail -50 $HOME/talon/talon.log"
