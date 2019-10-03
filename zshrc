#
##### ZSH SETTINGS #####
#
DEFAULT_USER=dabbeg
ZSH_THEME="zhann" # random frisk agnoster pure dabbeg Soliah refined

export PATH=$HOME/.local/bin:$PATH

eval `dircolors ~/.dircolors/dircolors.256dark`
eval "$(direnv hook zsh)"

#
##### PLUGINS #####
#
plugins=(git autojump)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
##### USER CONFIGURATION #####
#
export menu=rofi
export term=terminator

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
 else
    export EDITOR='nvim'
fi

# Base16 Shell
export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Execute neofetch
if which neofetch 1> /dev/null; then
    neofetch
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
alias vim='nvim'
alias bcolor='source $HOME/dotfiles/scripts/bcolor.sh'
alias activate='source venv/bin/activate'

alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rs'
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -Si'
alias paclo='sudo pacman -Qdt'
alias pacro='sudo paclo && sudo pacman -Rns $(pacman -Qtdq)'

alias spotify='spotify --force-device-scale-factor=1.2'
alias k='kubectl'
alias git-commmmit='git commit -m "$(curl "whatthecommit.com"|egrep "<p>"|sed "s/<p>//")"'
alias se='ag -l --ignore "node_modules" --ignore "target" --ignore "venv"'
alias ts='tempoc stop && tempoc clean && tempoc start --recent'

# Tempo specific env variables
export PATH=/home/davidh/.tempo/dolly/tempoc/bin:$PATH # Tempo CLI
export PATH=/home/davidh/.tempo/tempo-server/tserver/bin:$PATH # tserver CLI
export PATH=/opt/atlassian-plugin-sdk/bin:$PATH # atlassian CLI
export COMPOSE_ENV_LOCAL=/home/davidh/.tempo/config/zendesk-defaults-generated.yaml

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
