#!/usr/bin/env sh

dotfiles="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# to error out
warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

lnif() {
  if [[ ! -e $2 ]] ; then
    ln -s $1 $2
  fi
}

echo "Installing/Updating dotfiles...\n"

# if [ ! -e $dotfiles/.git ]; then
#   echo "Cloning dotfiles\n"
#   git clone https://github.com/fdietz/dotfiles.git $dotfiles
# else
#   echo "Updating dotfiles\n"
#   cd $dotfiles && git pull
# fi

# zsh
echo "Setting up zsh...\n"
lnif $dotfiles/zsh $HOME/.zsh
lnif $dotfiles/zlogout $HOME/.zlogout
lnif $dotfiles/zshrc $HOME/.zshrc
lnif $dotfiles/zshrc.pre $HOME/.zshrc.pre
lnif $dotfiles/zshrc.local $HOME/.zshrc.local

# fzf 
echo "Setting up fzf...\n"
lnif $dotfiles/fzf.zsh $HOME/.fzf.zsh

# vim
echo "Setting up vim...\n"
lnif $dotfiles/vim $HOME/.vim
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/gvimrc $HOME/.gvimrc
lnif $dotfiles/vimrc.local $HOME/.vimrc.local

# git
echo "Setting up git...\n"
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/gitignore_global $HOME/.gitignore_global

