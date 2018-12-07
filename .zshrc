export TERM=xterm-256color
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR=/usr/bin/vim
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="blinks"
plugins=(git npm sudo ssh-agent Z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
if [[ -a /usr/local/bin/vim ]]; then
  # for REHL
  alias vi='/usr/local/bin/vim'
  alias vim='/usr/local/bin/vim'
else
  # for ubuntu
  alias vi='/usr/bin/vim'
  alias vim='/usr/bin/vim'
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
alias dd='killall phantomjs-2.0.0-li2-osx.bin'
alias nuclear_option='pkill -9 ember; pkill -9 java; pkill -9 phantomjs; pkill -9 node; rm -rf ./tmp ~/.just ~/.bpr ~/.pemberly; echo -e "\t💣   💥   🔥   😎"'
alias cleantmp='rsync -av --delete ~/empty/ ~/voyager-web_trunk/tmp/'
alias goj='~/jobs-management-frontend_trunk/jobs-management-frontend/assets/javascripts'

export STORK_GIT_CAMPAIGNS_DIR=/Users/$USER/flock-templates_trunk
alias cat='pygmentize -O style=monokai -f console256 -g'
alias killember='killall -9 ember && echo "ember killed"'
alias killjava='killall -9 java && echo "java killed"'
alias killnode='killall -9 node && echo "node killed"'
alias killphantom='killall -9 phantomjs-2.0.0-li2-osx.bin && echo "phantom killed"'

alias jsfuck='killjava; killnode; killember; killphantom'
alias killjs='killjava; killnode; killember; killphantom'
alias g='git'
alias j='just'
alias v='vim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/bhsiung/.travis/travis.sh ] && source /Users/bhsiung/.travis/travis.sh

alias tmux="TERM=screen-256color-bce tmux -CC"
alias tmux2="TERM=xterm-256color-bce tmux -CC"

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
export PATH="$PATH:`yarn global bin`"
