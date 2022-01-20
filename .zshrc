# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/siuoly/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
cd

export PATH=~/.local/bin:$PATH
export PATH=~/.config/composer/vendor/bin:$PATH

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.

ZSH_THEME=random
ZSH_THEME="purify"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "purify" )
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	command-not-found
  zsh-syntax-highlighting
  extract # 解壓縮
  # git-open  # 瀏覽器打開當前repo 
	# z
	# colored-man-pages
  # rand-quote # 名言
  # zsh_reload # src , reload zshrc
)

eval "$(lua "/home/siuoly/.local/bin/z.lua"  --init zsh enhanced once echo)"     # 取代zsh-z 目錄移動跳轉

source $ZSH/oh-my-zsh.sh

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
#export MANPATH="$(manpath -g):$HOME/.cache/cppman"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
#export LANG=zh_TW.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source /home/siuoly/.local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

alias vizsh='vim ~/.zshrc'
alias C:='cd /mnt/c'
alias D:='cd /mnt/d'
alias cgdb='~/cgdb/cgdb/cgdb'
alias cman='cppman'
alias gg="g++"
alias pip=pip3
alias python="python3.8"
alias py=python
alias ipy=ipython
alias di=display
alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
alias explorer=explorer.exe
alias hserver="source ~/myScript/html.sh"
alias j="just"
alias gita="git add .;echo \"message? \"; read message ; git commit -m \"\$message\"; git push"
alias gis="git status"
alias gitl="git log --oneline"

alias envActive="source bin/activate"

alias vimless="/usr/local/share/vim/vim82/macros/less.sh"
alias myip="curl -s https://ipecho.net/plain; echo"
alias usage="du -h -d1"
alias wget_agent='wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36"'
alias translate_stdin="xargs -I {} translate {}"

alias vcpkg='/home/siuoly/projects/c++/vcpkg/vcpkg/vcpkg'
alias vicmake='vim CMakeLists.txt'


#--------------kb----------------------
helpmesg="Usage:
k                  # list
k <id>             # view <id>
k -e <id>          # edit <id>
k -a <statement>   # add <statement>
k -d <ids>         # delete <ids>
k --help, -h       # show help "
function k {
  # list
  if [[ $# -eq 0 ]];then
    kb list 
  # help, list, add, edit, delete
  elif [[ $# -gt 0 ]];then
    if [[ $1 == "--help" ]] || [[ $1 == "-h" ]];then #help
      echo $helpmesg 
    elif [[ $1 == "-e" && $2 != "" ]];then  #edit
      kb edit $2
    elif [[ $1 == "-a" ]];then              #add
      kb add ${@:2}
    elif [[ $1 == "-d" ]];then              #delete
      kb delete --id ${*[2,-1]}
    else                                    #view
      kb view $1
    fi
  fi
}
#-------------------------------------------------------
function kb_add {
  echo "null input to skip the name:"
  read  "title? title: "
  read  "category? category: "
  read  "tag? tag: "
  if [[ $title != ""    ]] ; then title="-t "$title ; fi
  if [[ $category != "" ]] ; then category="-c "$category ; fi
  if [[ $tag != ""      ]] ; then tag="-g "$tag ; fi
  echo "kb add $title $category $tag"
  kb add $title $category $tag
}
#---------------linux-command-----------------------
function tldr-lc { 
  if [[ $# -eq 1 ]]; then
    chrome https://wangchujiang.com/linux-command/c/$1.html 
  else
    chrome https://wangchujiang.com/linux-command/
  fi
}
#---------------linux-command-----------------------

export COMP_WORDBREAKS=" /\"\'><;|&(" 
export TERM="xterm-256color"

# awesome solution https://github.com/microsoft/WSL/issues/3632
export BROWSER='eval "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
# export BROWSER='/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'

export DISPLAY=":0"    # 用於Xlanuch
export DISPLAY=:0
export XDG_RUNTIME_DIR=/tmp/runtime-siuoly
export RUNLEVEL=3

function cd { # User define function
  builtin cd "$@" && ls -F
}

git_created_at(){    # 顯示repo創立時間
  curl https://api.github.com/repos/{$1} | grep create
}

wcd(){ # for WSL, jump to window path
  cd "`wslpath "$1"`"
}

# for vim-terminal plugin
[[ $VIM_TERMINAL ]] && alias vi=drop

# https://unix.stackexchange.com/q/12107
stty -ixon   # 使得 <C-S> 生效

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 

# source /home/siuoly/.config/broot/launcher/bash/br

bashcompinit
# source /home/siuoly/projects/c++/vcpkg/vcpkg/scripts/vcpkg_completion.zsh

PROMPT="%{$fg[cyan]%}%n%{$fg[green]%} %~"$'\n'"%{$fg[magenta]%}%T%{$reset_color%} "
