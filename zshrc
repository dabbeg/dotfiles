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

if [ `which pacman` ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


##### USER CONFIGURATION #####

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierforest.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#export PATH="/usr/local/bin:/usr/bin:/home/hir.is/$USER/bin:/usr/local/sbin:/usr/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
 else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias vim='nvim'
alias matlab-cli='matlab -nodisplay'
alias term='xfce4-terminal'
alias spotify='spotify --force-device-scale-factor=1.0000001'

# pacman aliases
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rs'
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -Si'
alias paclo='sudo pacman -Qdt'
alias pacro='sudo paclo && sudo pacman -Rns $(pacman -Qtdq)'
