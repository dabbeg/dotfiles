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
plugins=(git autojump kube-ps1)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

aws_profile() {
  local AWS_PROFILE_PROMPT
  if [[ ! -z "$AWS_SELECTED_PROFILE" ]]; then
    AWS_PROFILE_PROMPT="[$AWS_SELECTED_PROFILE]"
  fi
  echo "%F{3}$AWS_PROFILE_PROMPT%F{7}"
}

export PROMPT=$PROMPT'$(aws_profile)'
export PROMPT=$PROMPT'$(kube_ps1) '

#
##### USER CONFIGURATION #####
#
export menu=rofi
export term=terminator
export AWS_SDK_LOAD_CONFIG=1
export KUBECONFIG=$HOME/.kube/is-dev-cluster01:$HOME/.kube/is-staging-cluster01:$HOME/.kube/is-prod-cluster01
export DOCKER_BUILDKIT=1

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

[ -f "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"

# Source pyenv
if [ -d $HOME/.pyenv ] ; then
  eval "$(pyenv init -)"
fi

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
alias ggprush="ggpush; gh pr create; gh pr view -w"
alias git-commmmit='git commit -m "$(curl "whatthecommit.com"|egrep "<p>"|sed "s/<p>//")"'

alias spotify='spotify --force-device-scale-factor=2'
alias k='kubectl'
alias kc='kubectx'
alias kn='kubens'
alias se='ag -l --ignore "node_modules" --ignore "target" --ignore "venv"'
alias dc='docker-compose'
alias py='python'
alias po='poetry'
alias tf='terraform'
alias sso='eval $(source aws-sso; echo AWS_PROFILE="$AWS_PROFILE";) && export AWS_PROFILE && echo "Sourced profile \e[92m[$AWS_PROFILE]\e[0m"'
