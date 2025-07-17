bindkey -v # vi mode
KEYTIMEOUT=1 # Workaround for very slow entry into normal mode on command line

# Open command line in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line # alt-e to open command in $EDITOR

