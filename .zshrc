# If you come from bash you might have to change your $PATH.
# export PATH=/"usr/local/opt/python@3.7/bin:/usr/local/bin:$HOME/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.



if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
   git
  ssh-agent
  zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(/usr/local/share/zsh-completions $fpath)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alberto.negron/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alberto.negron/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/alberto.negron/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alberto.negron/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



#   Smarter Shorcuts
#   ------------------------------------------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='exa -la'                          # Preferred 'ls' implementation
alias ls='exa'
alias cat='bat'
alias lsd='exa -l | grep "^d"'               # List only directories
alias la="exa -lha"                          # List all files colorized in long format, including dot files
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias c='clear'                             # c:            Clear terminal display
alias edit='code --wait'                           # edit:         Opens any file in sublime editor
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
#####  Rails
alias be='bundle exec'
alias br='bin/rails'
alias cop='rubocop -a'
# git
alias dbranch="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"
### Open configuration
alias openalias="code ~/.zshrc"
alias loadalias="source ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias tf=terraform

#   -------------------------------
#   FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)


# mac only
alias users="dscl . list /Users | grep -v '^_'"
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }



# dbt aliases
alias dbtr="dbt --warn-error run --fail-fast" # sensible local defaults
alias dbtt="dbt test" # run all tests
alias dbtb="dbt build" # run build command https://docs.getdbt.com/reference/commands/build
alias dbtdg="dbt docs generate"
alias dbtds="dbt docs serve"
alias dbtc="dbt compile"
alias dbtfresh="dbt clean" #so fresh and so clean clean

# useful aliases for tools I use often when working on dbt
alias jparser='open -a "Google Chrome" https://j2live.ttl255.com/'
alias ychecker='open -a "Google Chrome" https://yamlchecker.com/'
alias dbtdocs='open -a "Google Chrome" https://docs.getdbt.com/docs/introduction'

# dbt Functions

# Run specific model with fail fast flag
function dbtrff() {
   dbt run -m $1 --fail-fast
   say done
}

# Run and test specific model with fail fast flag
function dbtrt() {
    dbt run -m $1 --fail-fast && dbt test -m $1 --warn-error
    say done
}


