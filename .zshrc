# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey '^r' history-search-backward
#bindkey '^f' history-search-forward
# bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/brendannolan/.local/share/zinit/polaris/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/TeX/texbin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/brendannolan/dev/scripts:/Users/brendannolan/.cargo/bin"

path+=('~/dev/scripts')
path+=("$HOME/.cargo/bin")

# Aliases
## Ls
alias l='exa --icons'
alias ll='exa -l --icons'
alias la='exa -la --icons'
alias ls='exa --icons'
## Git
alias g='git'
alias create-remote-repo='gh repo create --source=. --private --push'
alias vis='gh repo view --json visibility -q .visibility'
alias cf='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
## Copilot
alias cpe='gh copilot explain'
alias cps='gh copilot suggest'
### ChatGPT
alias gpt='chat --model gpt-4'
## Rust
alias cg=cargo
alias fmt-all='cargo +nightly fmt'
alias re='echo "Formatting ..." ; fmt-all ; echo "Checking ..." ; cargo check ; echo "Clippying ..." ; cargo clippy'
## Tmux
alias tka='tmux kill-server'
alias tls='tmux ls'
alias tm='tmux'
## Tmuxp
alias fux='tmuxp load (tmuxp ls | fzf --layout=reverse --info=inline --height=40%)'
## Misc
alias untar_command='echo tar xvzf'
alias nv='nvim .'

export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export RUST_BACKTRACE=1

export PROTOC="/opt/homebrew/bin/protoc"

export DISABLE_AUTO_TITLE='true'

# Enable vi mode
bindkey -v
# Stop the annoying lag (which is a known issue) when entering normal mode in vi mode.
# But apparently it's a sketchy thing to do: see the comment by wjv here:
# https://www.reddit.com/r/vim/comments/60jl7h/zsh_vimode_no_delay_entering_normal_mode/
KEYTIMEOUT=1
