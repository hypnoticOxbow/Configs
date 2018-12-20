
export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/ian/.oh-my-zsh


#Ruby gems stuff
#Setting the GEM_PATH and GEM_HOME variables may not be necessary, check 'gem env' output to verify whether both variables already exist
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin

export PASSWORD_STORE_CLIP_TIME=1000




# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"



#Powerline Settings -- Theme
# Configuracion POWERLVEL9K
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs virtualenv rvm time)
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

POWERLEVEL9K_DIR_HOME_BACKGROUND='39'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='39'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='39'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'


#POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='208'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

#New elements
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "


#POWERLEVEL9K_VCS_GIT_ICON=''
#POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
#POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
#POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
#POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
#
# `git hub colors`
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'
#
# Quitar iconos del inicio
#POWERLEVEL9K_HOME_ICON=''
#POWERLEVEL9K_HOME_SUB_ICON=''
#POWERLEVEL9K_FOLDER_ICON=''
#




# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo git compleat archlinux common-aliases pass last-working-dir autojump)




source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi


function ::() {python -c "from math import *; print($*)"}


function paste() {
  local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
          }
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=$HOME/bin:$PATH:$HOME/.cargo/bin/:$HOME/.local/bin/
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias clip="xclip -selection clipboard -i"
alias spotify="spotify --force-device-scale-factor=2"
alias man="viman"
alias pacman="pacman --color auto"
alias ws="cd ~/Documents/Workspace"
alias sch="cd ~/Documents/School/2018-Fall/"
alias prettyjson="python -m json.tool"
alias lc='colorls'
alias lct='colorls -A --sd --tree'
alias prettyjson="python -m json.tool"
alias vim=nvim
alias vi=nvim
alias ls=exa


alias loadnvm=". $HOME/.nvm/nvm.sh"
## OPAM configuration
#. /home/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Virtual ENV
#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh
#
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#Opam init
test -r /home/ian/.opam/opam-init/init.zsh && . /home/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source /home/ian/build/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
