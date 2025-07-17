# Set the directory we want to store zinit and plugins
ZINIT_ALL="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"
ZINIT_HOME="$ZINIT_ALL/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -la --icons --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -la --icons --color=always $realpath'

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q # Reloads plugins without resourcing .zshrc

