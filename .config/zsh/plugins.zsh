HISTFILE="${XDG_CACHE_HOME}/.zsh_history"

# Set the directory where manually loaded plugins will come from
ZSH_PLUGIN_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh_plugins"

FORCE_REBUILD_ZCOMP_DUMP=false

install_plugin() {
	local NAME=$1
	local REPO=$2
	local LOCATION="${ZSH_PLUGIN_HOME}/${NAME}"
	if [[ ! -d "${LOCATION}" ]]; then
        git clone "${REPO}" "${LOCATION}"
		if [[ "${NAME}" = "zsh-completions" ]]; then
            FORCE_REBUILD_ZCOMP_DUMP=true
		fi
	fi
}

install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions.git"
install_plugin "fzf-tab" "https://github.com/Aloxaf/fzf-tab"
install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

# Autosuggestion Styling
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # light gray

source_zsh_completions() {
	fpath=(path/to/zsh-completions/src $fpath)
	if "$FORCE_REBUILD_ZCOMP_DUMP"; then
            rm -f "${XDG_CACHE_HOME}/.zcompdump"
	fi
}

source_other_plugin() {
	local PLUGIN_NAME=$1
	local SOURCE_SCRIPT_NAME=$2
	source "${ZSH_PLUGIN_HOME}/${PLUGIN_NAME}/${SOURCE_SCRIPT_NAME}"
}

source_zsh_completions
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME}/.zcompdump"
source_other_plugin "fzf-tab" "fzf-tab.plugin.zsh"
source_other_plugin "zsh-autosuggestions" "zsh-autosuggestions.zsh"
source_other_plugin "zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"

# Hilight Styling (uses ANSI colour codes)
ZSH_HIGHLIGHT_STYLES[comment]='fg=8' # light gray
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=33' # light blue
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=9' # red

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -la --icons --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -la --icons --color=always $realpath'

