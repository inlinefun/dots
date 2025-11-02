# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/me/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

for file in $HOME/.config/zsh/*; do
    source $file
done