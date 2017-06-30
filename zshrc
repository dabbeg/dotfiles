##### ZSH SETTINGS #####

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="random" # Gets random themes from ~/.oh-my-zsh/themes/
#ZSH_THEME="frisk"
#ZSH_THEME="agnoster"
#ZSH_THEME="pure"
#ZSH_THEME="dabbeg"
#ZSH_THEME="zhann"
ZSH_THEME="Soliah"

#Specify default user to make zsh not display the current user
DEFAULT_USER=dabbeg

#dircolors for zsh
eval `dircolors ~/.dircolors/dircolors.256dark`

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

alias bcolor='source $HOME/dotfiles/scripts/bcolor.sh'
alias vim='nvim'

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

