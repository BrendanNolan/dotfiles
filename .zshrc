# Sourced only in interactive shells

for subconf in "vi"  "aliases"  "functions"  "plugins"  "shell_integrations"  "history_opts"; do
	source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/${subconf}.zsh"
done
