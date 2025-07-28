# Config
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
# Dev
export DEV_HOME="${HOME}/dev"
export SCRIPTS_HOME="${DEV_HOME}/scripts"

# PATH
## zsh automatically turns the path array into PATH. Here, we tell zsh that the path array should
## remove duplicates automatically
typeset -U path
path+=(/usr/bin "${SCRIPTS_HOME}" "${HOME}/.cargo/bin" /usr/local/bin /bin /usr/sbin /sbin)

# OTHER ENV VARS
export RUSTC_WRAPPER="${HOME}/.cargo/bin/sccache"
export RUST_BACKTRACE=1
export DISABLE_AUTO_TITLE=true
export EDITOR=nvim

# macOS Stuff
if [[ "$(uname)" = Darwin ]]; then
	if [[ -f "/opt/homebrew/bin/brew" ]]; then
		# Sets some environment variables to make sure that brew works
		eval "$(/opt/homebrew/bin/brew shellenv)"
		path+=(/opt/homebrew/opt/gnu-sed/libexec/gnubin)
	fi
	export PROTOC=/opt/homebrew/bin/protoc
fi

# Export PATH
export PATH
