# Set the directory where manually loaded plugins will come from
ZSH_PLUGIN_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh_plugins"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

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
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # light gray

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q # Reloads plugins without resourcing .zshrc

