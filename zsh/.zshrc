export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias py='python3'
alias vi='nvim'
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:/opt/nvim-linux-x86_64/bin
source /usr/share/doc/fzf/examples/key-bindings.zsh

eval "$(zoxide init zsh)"
fcd() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf)
    if [[ -n "$dir" ]]; then
        z "$dir"
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
