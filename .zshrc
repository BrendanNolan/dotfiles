# Sourced only in interactive shells

# Vi mode
bindkey -v
KEYTIMEOUT=1 # Workaround for very slow entry into normal mode on command line

# source_from_conf is defined in .zshenv
source_from_conf "aliases"
source_from_conf "functions"
source_from_conf "plugins"
source_from_conf "completion_styling"
source_from_conf "shell_integrations"

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q # Reloads plugins without resourcing .zshrc

# source_from_conf is defined in .zshenv
source_from_conf "history_opts"
