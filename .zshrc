# Needed programs:
# exa
# neovim
# prezto
# -- git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# (I guess git too)
# A powerline-compatible font

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
prompt nicoulaj

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify

# The following lines were added by compinstall
zstyle :compinstall filename '/home/wizard/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias vim='nvim'
alias e='nvim'
alias ls='exa'
alias "git commit"="git commit -S"
alias ddos=ping

export PATH=~/.bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
bindkey -v
