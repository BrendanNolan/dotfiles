# Sourced only in interactive shells

# Vi mode
bindkey -v
KEYTIMEOUT=1  # Workaround for very slow entry into normal mode on command line

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completion_styling.zsh"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/shell_integrations.zsh"

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q  # Reloads plugins without resourcing .zshrc

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history_opts.zsh"
