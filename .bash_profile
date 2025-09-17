# Config
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Dev
export DEV_HOME="${HOME}/dev"
export SCRIPTS_HOME="${DEV_HOME}/scripts"

# OTHER ENV VARS
export RUSTC_WRAPPER="${HOME}/.cargo/bin/sccache"
export RUST_BACKTRACE=1
export DISABLE_AUTO_TITLE=true
export EDITOR=nvim
export TMUX_PLUGIN_MANAGER_PATH="${XDG_CACHE_HOME}/tmux/plugins"

#PATH
PATH="/usr/bin:${PATH}"
PATH="/usr/local/bin:${PATH}"
PATH="/bin:${PATH}"
PATH="/usr/sbin:${PATH}"
PATH="/sbin:${PATH}"
PATH="${HOME}/.cargo/bin:${PATH}"
# macOS Stuff
if [[ "$(uname)" = Darwin ]]; then
	if [[ -f "/opt/homebrew/bin/brew" ]]; then
		# Sets some environment variables to make sure that brew works
		eval "$(/opt/homebrew/bin/brew shellenv)"
		PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"
	fi
	export PROTOC=/opt/homebrew/bin/protoc
fi
# scripts stuff
readarray -d '' scripts_subdirs < <(find "${SCRIPTS_HOME}" -type d -name .git -prune -o -type d -print0)
for dir in "${scripts_subdirs[@]}"; do
	PATH="${dir%/}:${PATH}"
done
PATH="${SCRIPTS_HOME}:${PATH}"
unset scripts_subdirs
uniquify_path() {
	local -a parts=()
	local -a unique=()
	local -A seen=()
	IFS=: read -r -a parts <<<"$PATH"
	for dir in "${parts[@]}"; do
		[[ -n $dir && -z ${seen[$dir]+x} ]] && unique+=("$dir") && seen[$dir]=1
	done
	PATH=$(
		IFS=:
		echo "${unique[*]}"
	)
}
uniquify_path
unset -f uniquify_path
export PATH
