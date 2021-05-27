export TERM="xterm-256color"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/home/ian/.oh-my-zsh


# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'



#Ruby gems stuff
#Setting the GEM_PATH and GEM_HOME variables may not be necessary, check 'gem env' output to verify whether both variables already exist
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin



export PASSWORD_STORE_CLIP_TIME=1000

#Neo-fuzz stuff
export HOST_NEO_FUZZ_HOME=$HOME/Projects/neo-fuzz/
export NEO_FUZZ_HOME=/neo-fuzz
export NEO_FUZZ_SLIME_PORT=6452


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"



#Powerline Settings -- Theme
# Configuracion POWERLVEL9K
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
if [ -n "${CHECKGIT+x}" ]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable_joined vcs)
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable_joined)
fi
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs rvm time)
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
 DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# removed: git, because svn is slow otherwise
plugins=(sudo archlinux last-working-dir autojump)




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

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

#autoload -Uz compinit
#compinit
## Completion for kitty
#kitty + complete setup zsh | source /dev/stdin


command_exists() {
	command -v ${1} >/dev/null;
};
must() {
	until ($@); do true; done
};

function viman() { man "$@" | nvim -R +":set ft=man" - ; }

function until_ok() {until ($0); do sleep .2; done };

function ecw() {emacs $* &}

function ::() {python -c "from math import *; print($*)"}

function gt() {GIT_AUTHOR_DATE=$1 GIT_COMMITTER_DATE=$1 git commit}

function yt() {youtube-dl -o - $* | castnow --quiet -}

function atouch() {
  mkdir -p $(sed 's/\(.*\)\/.*/\1/' <<< $1) && touch $1 && echo "$2" >> $1
}


function paste() {
  local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://acm.ian.kariniemi.dev/paste
          }
# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}



function spotifydl() {docker run --rm -it -v $(pwd):/music ritiek/spotify-downloader $*}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export PATH=$HOME/.local/bin:$HOME/bin:/home/ian/.opam/4.06.0/bin/:/home/ian/workspace/router/openwrt/staging_dir/toolchain-mips_24kc_gcc-8.3.0_musl/bin:$PATH:$HOME/.cargo/bin/:$HOME/Projects/neo-fuzz/code/tools/
export PATH=$PATH:$HOME/.emacs.d/bin/
export PATH=$PATH:$HOME/Projects/homer/elexir/elexirApp/
export PATH=$PATH:$HOME/racket/bin
export PATH=$PATH:/home/ian/Documents/School/2021-Spring/CSCI-5607/projects/final/target/release/
#export PATH=/home/ian/build/emacs-bin/:$PATH
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#Sift Aliases
alias cdr='cd `/bin/ls -d -1 -t /home/ian/workspace/Sift/neo-fuzz/trunk/code/test/results/* |head -1`'
alias st='svn st | grep . | grep -v "^[?X]" | grep -v "Performing status"'
alias pictures='ian@acm.ian.kariniemi.dev:~/www/.screenshots/'
alias clip='xargs echo -n | xclip -selection clipboard -i'
alias spotify="spotify --force-device-scale-factor=2"
alias man="viman"
alias pacman="pacman --color auto"
alias evw="cd ~/Projects/PL-Research/"
alias sch="cd ~/Documents/School/2021-Spring/"
alias nf="cd ~/Projects/neo-fuzz/code/"
alias hom="cd ~/Projects/homer"
alias svnls="svn st | cut -c 9-"
alias lc='lsd'
alias lct='colorls -A --sd --tree'
alias prettyjson="python -m json.tool"
alias vim=nvim
alias vi=nvim
alias cat='bat'
alias batp='bat --paging=never'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cg="export CHECKGIT=1"
alias ncg="unset CHECKGIT"
alias big='du -sh * |sort -rh |head'
alias wgetall='wget -r -nH --cut-dirs=2 --no-parent --reject="index.html*" '

alias aerc='TERM=xterm aerc'
alias tmux='TERM=xterm-256color tmux'

alias mutt='cd ~/.attachments && neomutt'
alias neomutt='cd ~/.attachments && neomutt'

alias loadnvm=". /usr/share/nvm/init-nvm.sh"


#ssh tmux
scamm() { eval $(ssh-agent) && mosh ikariniemi@scamm0 -- tmux attach -t 0 }

rhimes() { eval $(ssh-agent) && mosh ikariniemi@rhimes0 -- tmux attach -t 0 }

achilles() { eval $(ssh-agent) && mosh ikariniemi@achilles -- tmux attach -t 0 }

odysseus() { eval $(ssh-agent) && mosh ikariniemi@odysseus -- tmux attach -t 0 }

argo() { eval $(ssh-agent) && mosh ian@160.94.179.157 -- tmux attach -t 0 }

## OPAM configuration
#. /home/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Virtual ENV
export WORKON_HOME=~/.virtualenvs
#source ~/.zshrc.virtualenvwrapper
#source /usr/bin/virtualenvwrapper.sh
#
#SIFT Neo-Fuzz Config
export CIRCA_BASEPORT=6440
export CIRCA_BASENAME=ian
#Homer Arcade config
export HOMER_HOME=/home/ian/Projects/homer
export ARCADE_HOME=/home/ian/Projects/homer/components/arcade
export LISP_EXEC=sbcl
export LISP_LOAD="--load"

export RESTART_XOCHITL=1

source /usr/bin/virtualenvwrapper_lazy.sh


#
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#Opam init
test -r /home/ian/.opam/opam-init/init.zsh && . /home/ian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#source /home/ian/build/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#PATH="/home/ian/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/ian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/ian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/ian/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/ian/perl5"; export PERL_MM_OPT;
#



function countTimeDiff() {
    timeA=$1 # 09:59:35
    timeB=$2 # 17:32:55

    # feeding variables by using read and splitting with IFS
    IFS=: read ah am as <<< "$timeA"
    IFS=: read bh bm bs <<< "$timeB"

    # Convert hours to minutes.
    # The 10# is there to avoid errors with leading zeros
    # by telling bash that we use base 10
    secondsA=$((10#$ah*60*60 + 10#$am*60 + 10#$as))
    secondsB=$((10#$bh*60*60 + 10#$bm*60 + 10#$bs))
    DIFF_SEC=$((secondsB - secondsA))
    echo "The difference is $DIFF_SEC seconds.";

    SEC=$(($DIFF_SEC%60))
    MIN=$((($DIFF_SEC-$SEC)%3600/60))
    HRS=$((($DIFF_SEC-$MIN*60)/3600))
    TIME_DIFF="$HRS:$MIN:$SEC";
    echo $TIME_DIFF;
}
[ -f "/home/ian/.ghcup/env" ] && source "/home/ian/.ghcup/env" # ghcup-env
