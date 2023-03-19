# Setup fzf
# ---------
if [[ ! "$PATH" == */home/brendan/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/brendan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/brendan/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/brendan/.fzf/shell/key-bindings.bash"
