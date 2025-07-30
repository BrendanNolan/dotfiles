HISTFILE="${XDG_CACHE_HOME}/.zsh_history"

# Set the directory where manually loaded plugins will come from
ZSH_PLUGIN_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh_plugins"
mkdir -p "${ZSH_PLUGIN_HOME}"

first_load_of_zsh_completions=false

install_plugin() {
	local NAME=$1
	local REPO=$2
	local LOCATION="${ZSH_PLUGIN_HOME}/${NAME}"
	if [[ ! -d "${LOCATION}" ]]; then
		git clone "${REPO}" "${LOCATION}"
		if [[ "${NAME}" = "zsh-completions" ]]; then
			first_load_of_zsh_completions=true
		fi
	fi
}

install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions.git"
install_plugin "fzf-tab" "https://github.com/Aloxaf/fzf-tab"
install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

source_zsh_completions() {
	fpath=(path/to/zsh-completions/src $fpath)
	if "$first_load_of_zsh_completions"; then
            rm -f "${XDG_CACHE_HOME}/.zcompdump"
	fi
}

source_other_plugin() {
	local PLUGIN_NAME=$1
	local SOURCE_SCRIPT_NAME=$2
	source "${ZSH_PLUGIN_HOME}/${PLUGIN_NAME}/${SOURCE_SCRIPT_NAME}"
}

# Pay attention to the order here. The sourcing, compinit, zstyling, and env var setting are
# sensitive to the ordering of all of the following lines
# Completions
source_zsh_completions
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME}/.zcompdump"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
# Fzf-Tab
source_other_plugin "fzf-tab" "fzf-tab.plugin.zsh"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -la --icons --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -la --icons --color=always $realpath'
# Autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # light gray
source_other_plugin "zsh-autosuggestions" "zsh-autosuggestions.zsh"
# Syntax Highlighting
source_other_plugin "zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[comment]='fg=8' # light gray
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=33' # light blue
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=9' # red

unset first_load_of_zsh_completions
unset -f install_plugin
unset -f source_other_plugin
unset -f source_zsh_completions
