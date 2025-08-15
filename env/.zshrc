if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit
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
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='idea'
fi

# Aliases
alias bbb="brew update && brew upgrade && brew cleanup -s && brew autoremove && zinit update && gcloud components update"
alias c="clear"
alias vi="nvim"
alias vim="nvim"
alias fzfcp='fzf | pbcopy'
alias ls="eza --icons=auto -F"
alias less="/opt/homebrew/share/nvim/runtime/scripts/less.sh"
alias killspring="pkill -f 'spring-boot:run'"
alias y="yazi"

# function for open folder or file in IntelliJ with autocomplete (same behavior as vscvode with `code ...`) 
idea() {
    nohup /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea "$@" &>/dev/null &
}

# autojump setunp
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# RANCHER DESKTOP
export PATH="$HOME/.rd/bin:$PATH"

# secrets and tokens
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
