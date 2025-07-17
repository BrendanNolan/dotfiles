# Sourced only in interactive shells

source_from_conf() {
	source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/${1}.zsh"
}

source_from_conf "vi"
source_from_conf "aliases"
source_from_conf "functions"
source_from_conf "plugins"
source_from_conf "shell_integrations"
source_from_conf "history_opts"
