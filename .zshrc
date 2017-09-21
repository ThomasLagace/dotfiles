# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wizard/.zshrc'
prompt kylewest 

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias systemcuddle="systemctl"

export EDITOR=vim
export VISUAL=vim
