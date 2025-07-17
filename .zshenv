# PATH
## zsh automatically turns the path array into PATH. Here, we tell zsh that the path array should
## remove duplicates automatically
typeset -U path
path+=(/usr/bin $HOME/dev/scripts $HOME/.cargo/bin /usr/local/bin /bin /usr/sbin /sbin)

# Config
export XDG_CONFIG_HOME="$HOME/.config"

# OTHER ENV VARS
export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export RUST_BACKTRACE=1
export DISABLE_AUTO_TITLE=true
export EDITOR=nvim

source_from_conf() {
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/${1}.zsh"
}

# macOS Stuff
if [[ "$(uname)" = Darwin ]]; then
    source_from_conf "macos_env"
fi

# Export PATH
export PATH
