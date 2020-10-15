#
##### ZSH SETTINGS #####
#
DEFAULT_USER=dabbeg
ZSH_THEME="zhann" # random frisk agnoster pure dabbeg Soliah refined

export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/istio-1.4.5/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"

eval `dircolors ~/.dircolors/dircolors.256dark`
eval "$(direnv hook zsh)"

#
##### PLUGINS #####
#
plugins=(git autojump kube-ps1 poetry)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PROMPT=$PROMPT'$(kube_ps1) '

#
##### USER CONFIGURATION #####
#
export menu=rofi
export term=terminator
export AWS_SDK_LOAD_CONFIG=1
export KUBECONFIG=$HOME/.kube/viceversa:$HOME/.kube/dev-cluster01:$HOME/.kube/staging-cluster01:$HOME/.kube/smaug

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
 else
    export EDITOR='nvim'
fi

# Base16 Shell
export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/share/nvm/init-nvm.sh

# Source pyenv
if [ -d $HOME/.pyenv ] ; then
  eval "$(pyenv init -)"
fi

# This is all to bind Ctrl-o to run lopen
function lopen_func() { lopen }
zle -N lopen_widget lopen_func
bindkey '^o' lopen_widget

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

alias gca='git commit --amend --all --no-edit'

alias spotify='spotify --force-device-scale-factor=1.2'
alias k='kubectl'
alias kc='kubectx'
alias kn='kubens'
alias git-commmmit='git commit -m "$(curl "whatthecommit.com"|egrep "<p>"|sed "s/<p>//")"'
alias se='ag -l --ignore "node_modules" --ignore "target" --ignore "venv"'
alias dc='docker-compose'
alias po='poetry'
