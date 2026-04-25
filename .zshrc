export TERM=xterm-256color

# Prompt: CWD (orange) > (red)
autoload -U colors && colors
setopt PROMPT_SUBST
PROMPT='%F{208}%~%f %F{red}>%f '

# Editor
export EDITOR=/opt/homebrew/bin/nvim
alias v='/opt/homebrew/bin/nvim'
alias vi='v'
alias vo='v -u NONE'

# Aliases
alias yolo='claude --agent bear-helper:Sophia:AGENT --dangerously-skip-permissions'
alias pok='okt git dev && npm test && npm run pub && okt git prepub -d'
alias g='git'
alias ag='ag --path-to-ignore ~/.ignore'

# cargo
. "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$HOME/.local/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
