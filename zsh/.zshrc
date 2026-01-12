# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true
export GH_BROWSER=wslview

# bindings
bindkey -e
bindkey '^F' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey '^[w' kill-region

# aliases 
alias which='type -a'
alias ll='exa -l --icons --no-user'
alias ls='exa -la --no-permissions --icons --no-user'
alias lss='exa -la -s modified --no-permissions --icons --no-user'
alias tree='exa --tree -l --no-permissions --icons --no-user'
alias cdh='cd $home'
alias g='git'
alias lg='lazygit'
alias ld='lazydocker'
alias list-npm-globals='npm list -g --depth=0' # List out all globally installed npm packages
alias gcob='git branch | fzf | xargs git checkout' # checkout branch using fzf

# Load completions
autoload -Uz compinit && compinit

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light hlissner/zsh-autopair
zinit light lukechilds/zsh-nvm

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::git-extras
zinit snippet OMZP::sudo
zinit snippet OMZP::ubuntu
zinit snippet OMZP::command-not-found

zinit cdreplay -q

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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

# Created by newuser for 5.9
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi 

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
export PATH="$PATH:/snap/bin"
