export TERM="xterm-256color"

export PATH=$HOME/bin:$HOME/.local/bin:$PATH
# haskell
export PATH=$HOME/.ghcup/bin:$HOME/.cabal/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

fpath+=$HOME/.zsh/pure
# Pure theme
PURE_PROMPT_SYMBOL='»'
autoload -U promptinit; promptinit
prompt pure


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  history
  tmux
  fzf
  docker
  kubectl
  bazel
  jq
)

# Fix slow paste (see https://apple.stackexchange.com/a/384160)
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

# "plugins" managed by pacman / yay
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh


# User configuration
#
# Fix vi-mode stealing CTRL+R to fzf
zvm_after_init_commands+=("bindkey '^R' fzf-history-widget")
# fish-shell history search with vi-mode
# https://github.com/zsh-users/zsh-history-substring-search/issues/106
zvm_after_init_commands+=("bindkey '^[[A' history-substring-search-up")
zvm_after_init_commands+=("bindkey '^[[B' history-substring-search-down")
zvm_after_init_commands+=("bindkey -M vicmd 'k' history-substring-search-up")
zvm_after_init_commands+=("bindkey -M vicmd 'j' history-substring-search-down")

# yank from vi-mode to system clipboard
# https://github.com/jeffreytse/zsh-vi-mode/issues/19
zvm_vi_yank () {
	zvm_yank
	printf %s "${CUTBUFFER}" | xclip -sel c
	zvm_exit_visual_mode
}

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=239"

# vi
alias vi='vim'
alias v='vim'

# tmux
alias tma='tmux attach -t'
alias tmad='tmux attach -d -t'
alias tms='tmux new-session -s'
alias tml='tmux list-sessions'
alias tmksv='tmux kill-server'
alias tmkss='tmux kill-session -t'

alias config='/usr/bin/git --git-dir=/home/rpadn/.cfg/ --work-tree=/home/rpadn'

# git override
alias gap='git add -p'
alias glo='git log'

# exa over ls
unalias la
alias ls='exa'
alias ll='ls -lh --git'
alias la='ls -la --git'

alias cat='bat'

# gtags
export GTAGSLABEL=pygments

# autostart X11
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
