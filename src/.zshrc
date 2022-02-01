#
##### ZSH SETTINGS #####
#
DEFAULT_USER=dabbeg
ZSH_THEME="zhann" # random frisk agnoster pure dabbeg Soliah refined

export PATH=$HOME/.local/bin:$PATH

#
##### PLUGINS #####
#
plugins=(
  archlinux
  autojump
  aws
  colored-man-pages
  direnv
  fzf
  git
  kube-ps1
  nvm
  pyenv
  terraform
)

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PROMPT=$PROMPT'$(kube_ps1) '

#
##### USER CONFIGURATION #####
#
export DOCKER_BUILDKIT=1
export AWS_SDK_LOAD_CONFIG=1
export KUBECONFIG=$HOME/.kube/is-shared-cluster01:$HOME/.kube/is-dev-cluster01:$HOME/.kube/is-staging-cluster01:$HOME/.kube/is-prod-cluster01

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
 else
    export EDITOR='nvim'
fi

# Base16 Shell
export BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# AWS sso shortcut
function sso (){
  export AWS_PROFILE=$1
  aws-sso-util login --profile $AWS_PROFILE-sso
}

# Alias
alias vim='nvim'
alias bcolor='source $HOME/dotfiles/scripts/bcolor.sh'
alias activate='source venv/bin/activate'

alias gca='git commit --amend --all --no-edit'
alias ggprush="ggpush; gh pr create; gh pr view -w"
alias git-commmmit='git commit -m "$(curl "whatthecommit.com"|egrep "<p>"|sed "s/<p>//")"'

alias k='kubectl'
alias kc='kubectx'
alias kn='kubens'
alias se='ag -l --ignore "node_modules" --ignore "target" --ignore "venv"'
alias dc='docker-compose'
alias py='python'
alias po='poetry'
alias ssh='TERM=xterm-256color ssh'
alias firefox='MOZ_ENABLE_WAYLAND=1 firefox'
