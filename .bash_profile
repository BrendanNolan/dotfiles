# Config
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

# Dev
export DEV_HOME="${HOME}/dev"
export SCRIPTS_HOME="${DEV_HOME}/scripts"

# OTHER ENV VARS
export RUSTC_WRAPPER="${HOME}/.cargo/bin/sccache"
export RUST_BACKTRACE=1
export DISABLE_AUTO_TITLE=true
export EDITOR=nvim

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
readarray -d '' scripts_subdirs < <(fd -0 -t d . "${SCRIPTS_HOME}")
for dir in "${scripts_subdirs[@]}"; do
	PATH="${dir}:${PATH}"
done
PATH="${SCRIPTS_HOME}:${PATH}"
unset scripts_subdirs
uniquify_path() {
	local IFS=:
	local -a parts=("${PATH}") # Split the path into an array based on colon separators
	local -A seen=()           # Create an associative array of things already seen
	local -a unique=()
	for dir in "${parts[@]}"; do
		[[ -n "${dir}" && -z "${seen[${dir}]}" ]] && unique+=("${dir}") && seen["${dir}"]=1
	done
	PATH=$(
		IFS=:
		echo "${unique[*]}"
	) # Echo the uniquified array with colon separators
}
uniquify_path
unset -f uniquify_path
export PATH
