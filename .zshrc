# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ $DACS ]]; then
  XDG_CACHE_HOME=$DACS
  source "${DACS}/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
elif [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  XDG_CACHE_HOME=''
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# ZSH_THEME="blinks"
# ZSH_THEME="af-magic"
# ZSH_THEME="geoffgarside"
# ZSH_THEME="theunraveler"
ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git npm ssh-agent Z)
plugins=(
  git
  #ssh-agent
  #z
)

source $ZSH/oh-my-zsh.sh
alias pok='okt git dev && npm test && npm run pub && okt git prepub -d'
if [[ -a ~/nvim-osx64/bin/nvim ]]; then
  alias v='~/nvim-osx64/bin/nvim'
  alias vi='v'
  export EDITOR=~/nvim-osx64/bin/nvim
  alias vo='v -u NONE'
elif [[ -a /opt/homebrew/bin/nvim ]]; then
  alias v='/opt/homebrew/bin/nvim'
  alias vi='v'
  export EDITOR=/opt/homebrew/bin/nvim
  alias vo='v -u NONE'
elif [[ -a /usr/bin/nvim.appimage ]]; then
  alias v='/usr/bin/nvim.appimage'
  alias vim='/usr/bin/nvim.appimage'
  export EDITOR=/usr/bin/nvim.appimage
  alias vc='vim -u ~/.config/nvim/init.coc.vim'
  alias vo='vim -u ~/.config/nvim/init.simple.vim'
elif [[ -a /Users/bhsiung/nvim-osx64/bin/nvim ]]; then
  alias v='/Users/bhsiung/nvim-osx64/bin/nvim'
  export EDITOR=/Users/bhsiung/nvim-osx64/bin/nvim
  alias vc='v -u ~/.config/nvim/init.coc.vim'
  alias vo='v -u ~/.config/nvim/init.simple.vim'
elif [[ -a /usr/local/bin/nvim ]]; then
  # mac!!
  #eval "$(starship init zsh)"
  alias v='/usr/local/bin/nvim'
  alias vim='/usr/local/bin/nvim'
  export EDITOR=/usr/local/bin/nvim
  alias vc='v -u ~/.config/nvim/init.coc.vim'
  alias vo='v -u ~/.config/nvim/init.simple.vim'
elif [[ -a /usr/local/bin/vim ]]; then
  # for REHL
  # alias vi='/usr/local/bin/vim'
  # alias vim='/usr/local/bin/vim'
  alias v='/usr/local/bin/vim'
  alias vim='/usr/local/bin/vim'
  export EDITOR=/usr/local/bin/vim
else
  # for ubuntu
  alias v='/usr/bin/vim'
  alias vim='/usr/bin/vim'
  export EDITOR=/usr/bin/vim
fi


# for powerline-shell
# function powerline_precmd() {
    # PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)"
# }

# function install_powerline_precmd() {
  # for s in "${precmd_functions[@]}"; do
    # if [ "$s" = "powerline_precmd" ]; then
      # return
    # fi
  # done
  # precmd_functions+=(powerline_precmd)
# }

# if [ "$TERM" != "linux" ]; then
    # install_powerline_precmd
# fi
alias submit='git fetch && git rebase origin/master && mint submit'
# alias cat='pygmentize -O style=monokai -f console256 -g'
alias g='git'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND='fd --type f'
export FZF_CTRL_T_OPTS='--height 40% --layout=reverse --border --preview "cat {}"'


# added by travis gem
[ -f /Users/bhsiung/.travis/travis.sh ] && source /Users/bhsiung/.travis/travis.sh

# alias tmux="TERM=screen-256color-bce tmux -CC"
# alias tmux2="TERM=xterm-256color-bce tmux -CC"
alias tmux-ts="ssh -t bhsiung-ld1 tmux -CC a -t ts"

# zsh-sticky-prefix

local zle_sticked=""

zle-line-init() {
    BUFFER="$zle_sticked$BUFFER"
    zle end-of-line
}
zle -N zle-line-init

function zle-set-sticky {
    zle_sticked="$BUFFER"
    zle -M "Sticky: '$zle_sticked'."
}
zle -N zle-set-sticky
bindkey '^S' zle-set-sticky

function accept-line {
    if [[ -z "$BUFFER" ]] && [[ -n "$zle_sticked" ]]; then
        zle_sticked=""
        echo -n "\nRemoved sticky."
    fi
    zle .accept-line
}
zle -N accept-line

# enable yarn executable path
export PATH="$PATH:/Users/biingyannhsiung/Library/Python/3.9/bin:`yarn global bin`"

ontsweb() {
  mpName=`pwd|sed 's/.*\(ember-ts-.*\)_trunk$/\1/'`
  files=`git show --pretty="" --name-only|grep '^addon'`
  local IFS=$'\n'

  if [ $ZSH_VERSION ]; then
    setopt sh_word_split
  fi

  for f in $files; do
    cp $f ~/ts-web/node_modules/@linkedin/$mpName/$f
  done;

  cd ~/ts-web
  echo "\n" >> app/router.js
  git co -- app/router.js
  cd ~/$mpName"_trunk"
}

onconsumer() {
  mpName=`pwd|sed 's/.*\(ember-ts-.*\)_trunk$/\1/'`
  files=`git show --pretty="" --name-only|grep '^addon'`
  local IFS=$'\n'

  if [ $ZSH_VERSION ]; then
    setopt sh_word_split
  fi

  for f in $files; do
    cp $f ~/$1/node_modules/@linkedin/$mpName/$f
  done;

  cd ~/$1
  echo "\n" >> tests/dummy/app/router.js
  git co -- tests/dummy/app/router.js
  cd ~/$mpName"_trunk"
}

up () {
  branchName=`git branch | grep \* | cut -d ' ' -f2`
  git co master && git pull && git co $branchName && git rebase master
  # git fetch --all && git pull --rebase && git merge origin/master
}

merg () {
  branchName=`git branch | grep \* | cut -d ' ' -f2`
  git co master && git merge --squash $branchName && git ci -m "$1"
}

to-gerrit() {
  path=`echo "$1" | sed -e 's/^.*\?name=//' -e 's/&path.*//'`
  f=`echo "$1" | sed -e 's/.*addon/addon/' -e 's/&.*$//' -e 's/%2F/\//'`
  hash=`git log --pretty=format:"%H" $path$f |head -n 1`
  echo "https://git.corp.linkedin.com:1367/a/plugins/gitiles/talent-solutions/ember-ts-job-posting/+/$hash/$1"
}
toGerrit() {
  hash=`git log --pretty=format:"%H" $1 |head -n 1`
  echo "https://git.corp.linkedin.com:1367/a/plugins/gitiles/talent-solutions/ember-ts-job-posting/+/$hash/$1"
}

ship () {
  git rd -r $1 && git submit --async
}

checkin() {
  up && merg $1 && ship $2
}

renew () {
  if [ -d apps ]; then
    exe='just yarn start'
  else
    exe="yarn start --port ${$1} --proxy=https://www.linkedin.com/"
  fi
  echo $exe
  # mint update && just init --clean && just yarn start --port $1 --proxy=https://www.linkedin.com/
}

tt() {
  tailf $1 | grep "Log from external process" | sed -E 's/^([0-9]+\/[0-9]+\/[0-9]+ [0-9]+:[0-9]+:[0-9]+\.[0-9]+).*Log from external process:/\1/g'
}

# enable node 12.13.0
if [[ -a ~/.profile ]]; then
  . ~/.profile
fi

# for v-web
export NODE_OPTIONS="--max-old-space-size=8192"

# for colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long' # detailed list view
alias lc='colorls -lA --sd'

# ag
alias ag='ag --path-to-ignore ~/.ignore'
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# DACS
alias okok="cd $DACS/FE/Documents/ok"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ ! -f {$DACS}/.p10k.zsh ]]; then
  source $DACS'/.p10k.zsh'
 elif [[ ! -f ~/.p10k.zsh ]]; then
   source ~/.p10k.zsh
 fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
