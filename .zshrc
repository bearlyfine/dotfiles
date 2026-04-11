# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# source ~/repos/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# source ~/repos/zsh-plugins/zsh-autocomplete/git.plugin.zsh

export PATH=$PATH:/opt/homebrew/bin

# bindkey '	' autosuggest-accept
bindkey '[C' forward-word  # Option + Right
bindkey '[D' backward-word # Option + Left

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#Golang
#export GOROOT=/Users/bytedance/.go
#export PATH=/Users/bytedance/.go/bin:$PATH
#export GOPATH=/Users/bytedance/go
#export PATH=/Users/bytedance/go/bin:$PATH
#Golang
#export PATH=$PATH:/Users/bytedance/go/bin

# aliases
alias gcm="git commit -m" 
alias gca="git commit --amend" 
alias gl="git log" 
alias vi="vim" 
alias gs="git status" 
alias ga="git add" 
alias ls="ls -G"

alias cs=cursor

# Make command
alias mlist="make -f ~/3.Resources/MakeScripts/Makefile cmd list"
alias mcd="make -f ~/3.Resources/MakeScripts/Makefile cmd cd"
alias mopen="make -f ~/3.Resources/MakeScripts/Makefile cmd open"

# file maneger 
alias ya=yazi

# for unlimit history 
alias history="history 0"

alias fish-history='fish -c "history"'

alias local-swiftc=~/bd-swift-project/build/Ninja-DebugAssert/swift-macosx-arm64/bin/swiftc
alias local-swift-frontend=~/bd-swift-project/build/Ninja-DebugAssert/swift-macosx-arm64/bin/swift-frontend
alias local-clang=~/bd-swift-project/build/Ninja-DebugAssert/llvm-macosx-arm64/bin/clang

alias j-long-term="cd /Users/bytedance/AwemeBox/lsw_long_term/Aweme"

alias cp-pwd="pwd | tr -d '\n' | pbcopy"

# tab show pwd 
DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# sources
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /Users/bytedance/4.Archives/GitRepos/repos/zsh-plugins/zsh-z/zsh-z.plugin.zsh
source /Users/gorgeous/github.com/zsh-z/zsh-z.plugin.zsh

# source ~/.zsh/git-prompt.zsh/git-prompt.zsh
# source ~/.zsh/git-prompt.zsh/examples/pure.zsh
# source /Users/gorgeous/github.com/zsh-git-prompt/zshrc.sh
source /Users/gorgeous/github.com/git-prompt.zsh/git-prompt.zsh
source /Users/gorgeous/github.com/git-prompt.zsh/examples/multiline.zsh
# an example prompt
# PROMPT='%B%m%~%b$(git_super_status) %# '

# fzf
export FZF_DEFAULT_COMMAND="fd --exclude=.git"
# source ~/.zsh/fzf-history.zsh # <c-r> toggle history search
# source <(fzf --zsh) # <c-t> toggle file search


#
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# history 
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed

source $HOME/.local/bin/env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gorgeous/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gorgeous/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gorgeous/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gorgeous/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# export PATH="/opt/homebrew/Caskroom/miniconda/base/envs/py311/bin:$PATH"
export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"

WORDCHARS=${WORDCHARS/\/}
#Golang
export PATH=$PATH:/Users/bytedance/go/bin

export PATH=$PATH:/Applications/Slardar.app/Contents/Resources/Program

export LLVM_SYMBOLIZER_PATH=/Users/bytedance/ExternalDisk/bd-swift-project/build/Ninja-RelWithDebInfoAssert/llvm-macosx-arm64/bin/llvm-symbolizer

# Use -- as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='--'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

## yazi 
source /opt/homebrew/share/zsh/site-functions
alias yz=yazi

## bazel completion
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -Uz compinit
compinit

#Gemini
export GOOGLE_CLOUD_PROJECT=coral-pipe-468314-t9


. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f "/Users/gorgeous/.ghcup/env" ] && . "/Users/gorgeous/.ghcup/env" # ghcup-env

# OpenClaw Completion
source "/Users/gorgeous/.openclaw/completions/openclaw.zsh"

# Rust 
. "$HOME/.cargo/env"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# bun completions
[ -s "/Users/gorgeous/.bun/_bun" ] && source "/Users/gorgeous/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
