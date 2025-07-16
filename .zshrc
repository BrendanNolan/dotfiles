# Sourced only in interactive shells

# Vi mode
bindkey -v
KEYTIMEOUT=1  # Workaround for very slow entry into normal mode on command line

# As the name of this function suggests, it should not be used elsewhere
source_conf_for_zshrc() {
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/${1}.zsh"
}

source_conf_for_zshrc "aliases"
source_conf_for_zshrc "functions"
source_conf_for_zshrc "plugins"
source_conf_for_zshrc "completion_styling"
source_conf_for_zshrc "shell_integrations"

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q  # Reloads plugins without resourcing .zshrc

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history_opts.zsh"
