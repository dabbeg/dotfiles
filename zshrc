##### ZSH SETTINGS #####

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/.local/bin:$PATH

#ZSH_THEME="random" # Gets random themes from ~/.oh-my-zsh/themes/
#ZSH_THEME="frisk"
#ZSH_THEME="agnoster"
#ZSH_THEME="pure"
#ZSH_THEME="dabbeg"
ZSH_THEME="zhann"
#ZSH_THEME="Soliah"
#ZSH_THEME="refined"

#Specify default user to make zsh not display the current user
DEFAULT_USER=dabbeg

#dircolors for zsh
eval `dircolors ~/.dircolors/dircolors.256dark`

eval "$(direnv hook zsh)"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

##### PLUGINS #####

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh
if hash pacman 2> /dev/null; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


##### USER CONFIGURATION #####

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
 else
    export EDITOR='nvim'
fi
# Base16 Shell
#export BASE16_SHELL='/home/dabbeg/.config/base16-shell/scripts/base16-twilight..sh'
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Execute neofetch
if which neofetch 1> /dev/null; then
    neofetch
fi

alias bcolor='source $HOME/dotfiles/scripts/bcolor.sh'
alias vim='nvim'
alias activate='source venv/bin/activate'

# pacman aliases
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rs'
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -Si'
alias paclo='sudo pacman -Qdt'
alias pacro='sudo paclo && sudo pacman -Rns $(pacman -Qtdq)'

# Other aliases
alias matlab-cli='matlab -nodisplay'
alias term='urxvt'
alias spotify='spotify --force-device-scale-factor=1.2'
alias k='kubectl'
alias git-commmmit='git commit -m "$(curl "whatthecommit.com"|egrep "<p>"|sed "s/<p>//")"'
alias se='ag -l --ignore "node_modules" --ignore "target"'
alias ts='tempoc stop && tempoc clean && tempoc start --recent'

export PATH=/home/davidh/.tempo/dolly/tempoc/bin:$PATH # Tempo CLI
export PATH=/opt/atlassian-plugin-sdk/bin:$PATH # Tempo CLI

# Start the ssh-agent automatically, and only one allowed to run at a time
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/davidh/.nvm/versions/node/v9.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# echo ${UID} >> uid
# if test -z "${XDG_RUNTIME_DIR}"; then
#     export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
#     if ! test -d "${XDG_RUNTIME_DIR}"; then
#         mkdir "${XDG_RUNTIME_DIR}"
#         chmod 0700 "${XDG_RUNTIME_DIR}"
#     fi
# fi

#export NPM_KEY="5bea5fb2-99bc-4e35-a0d4-2c46231861bf"
export NPM_KEY="a70c9855-c453-49a4-93d0-4cc29f694aee"


term=terminator
menu=rofi
export PATH=/home/davidh/.tempo/tempo-server/tserver/bin:$PATH # tserver CLI
export COMPOSE_ENV_LOCAL=/home/davidh/.tempo/config/zendesk-defaults-generated.yaml
