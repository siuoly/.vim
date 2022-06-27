# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/siuoly/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
[[ $nnn == '' ]] && cd

export PATH=~/.local/bin:$PATH

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.

# ZSH_THEME=random
# ZSH_THEME="purify"
#
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "purify" )
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"  # 更新訊息吵死了

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
	# command-not-found
  # zsh-syntax-highlighting
  extract # 解壓縮
  # git-open  # 瀏覽器打開當前repo 
	# z
  last-working-dir  # 最後工作資料夾
	# colored-man-pages
  # rand-quote # 名言
  # zsh_reload # src , reload zshrc
)

source $ZSH/oh-my-zsh.sh

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# User configuration

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



# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias vizsh='vim ~/.zshrc'
alias vignore='vim .gitignore'
alias expath='wslpath -w `pwd`'
alias vitmux='vim ~/.tmux.conf'
alias C:='cd /mnt/c'
alias D:='cd /mnt/d'
alias gg="g++"
alias py=python
alias ipy=ipython
alias di=display
alias explorer=explorer.exe
alias hserver="source ~/myScript/html.sh"
alias gita="git add .;echo \"message? \"; read message ; git commit -m \"\$message\"; git push"
alias gis="git status"
alias gitl="git log --oneline"
alias v="vim"

alias vimless="/usr/local/share/vim/vim82/macros/less.sh"
alias myip="curl -s https://ipecho.net/plain; echo"
alias usage="du -h -d1"
alias wget_agent='wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36"'
alias translate_stdin="xargs -I {} translate {}"

alias vcpkg='/home/siuoly/projects/c++/vcpkg/vcpkg/vcpkg'
alias vicmake='vim CMakeLists.txt'
alias exe='exec zsh'
alias anaconda="cmd.exe /k conda activate"
alias condapy="cmd.exe /c 'conda activate && python'" # run python in conda enviroment
alias pdb="python -mpdb"


export COMP_WORDBREAKS=" /\"\'><;|&(" 
export TERM="xterm-256color"

# awesome solution https://github.com/microsoft/WSL/issues/3632
# export BROWSER='eval "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
# export BROWSER='/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
export BROWSER="explorer.exe"
export EDITOR="vim"


# export DISPLAY=192.168.1.100:0.0  # 同上  # 用於Xlanuch ,wsl1
# export DISPLAY=$(ip route list default | awk '{print $3}'):0
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0

export XDG_RUNTIME_DIR=/tmp/runtime-siuoly
export RUNLEVEL=3
# cuda usage
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PAT


function cd { # User define function
  builtin cd "$@" && ls -F
}

github_repo_start(){    # 顯示repo創立時間
  curl https://api.github.com/repos/{$1} | grep create
}

####### thefuck
eval $(thefuck --alias)


# for vim-terminal plugin
[[ $VIM_TERMINAL ]] && alias vi=drop

# https://unix.stackexchange.com/q/12107
stty -ixon   # 使得 <C-S> 生效

bashcompinit

# 取代zsh-z 目錄移動跳轉
eval "$(lua '/home/siuoly/.vim/script/z.lua' --init zsh once enhanced)"     
ZLUA_LUAEXE='/usr/bin/lua5.2'
#
############################# fzf script  #################################
# fd - cd to selected directory
# fd() {
#   local dir
#   dir=$(find ${1:-.} -path '*/\.*' -prune \
#                   -o -type d -print 2> /dev/null | fzf +m) &&
#   cd "$dir"
# }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# PROMPT="%{$fg[cyan]%}%n%{$fg[green]%} %~"$'\n'"%{$fg[magenta]%}%T%{$reset_color%} "
PROMPT="%{$fg[magenta]%}%T%{$reset_color%}""%{$terminfo[bold]$FG[075]%} %~"$'\n''%{$FG[206]%}>%{$reset_color%}'
# PS1=' %{$terminfo[bold]$FG[075]%}%~'$'\n''%{$FG[206]%}>%{$reset_color%}'

alias o="z \`sed 's/|.*//g' ~/.z| fzf \`"
alias zi="z -I"

# auto matically execute tmux
# [[ $TMUX == ''  ]] && tmux

# nnn usage
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
export NNN_PLUG='z:autojump;f:fzopen;'
export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/siuoly/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/siuoly/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/siuoly/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/siuoly/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

source /home/siuoly/.config/broot/launcher/bash/br
