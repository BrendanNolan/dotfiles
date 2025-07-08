# PATH
## zsh automatically turns the path array into PATH. Here, we tell zsh that the path array should
## remove duplicates automatically
typeset -U path
path+=($HOME/dev/scripts $HOME/.cargo/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/homebrew/bin)
case "$(uname)" in
    Darwin) path+=(/opt/homebrew/bin /opt/homebrew/opt/gnu-sed/libexec/gnubin) ;;
    *) ;;
esac
export PATH

# Config
export XDG_CONFIG_HOME="$HOME/.config"

# OTHER ENV VARS
export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export RUST_BACKTRACE=1
export PROTOC=/opt/homebrew/bin/protoc
export DISABLE_AUTO_TITLE=true
export EDITOR=nvim

