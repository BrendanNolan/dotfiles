# Sourced only in interactive shells

for subconf in "vi" "aliases" "functions" "history_opts" "shell_integrations" "plugins"; do
	source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/${subconf}.zsh"
done
