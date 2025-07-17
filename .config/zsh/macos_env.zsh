if [[ -f "/opt/homebrew/bin/brew" ]]; then
	# Sets some environment variables to make sure that brew works
	eval "$(/opt/homebrew/bin/brew shellenv)"
	path+=(/opt/homebrew/opt/gnu-sed/libexec/gnubin)
fi
export PROTOC=/opt/homebrew/bin/protoc
