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
  if [ ! -e $2 ] ; then
    ln -s $1 $2
  fi
}

echo "Installing/Updating dotfiles..."
if [ ! -e $dotfiles/.git ]; then
  echo "Cloning dotfiles"
  git clone https://github.com/drvos/dotfiles.git $dotfiles
else
  echo "Updating dotfiles"
  cd $dotfiles && git pull
  echo
fi
git submodule update --init

#
mkdir -p $HOME/bin

# zsh
echo "Setting up zsh..."
lnif $dotfiles/zsh $HOME/.zsh
lnif $dotfiles/zlogout $HOME/.zlogout
lnif $dotfiles/zshrc $HOME/.zshrc
lnif $dotfiles/zshrc.pre $HOME/.zshrc.pre
touch $HOME/.zshrc.local

# fzf
echo "Setting up fzf..."
lnif $dotfiles/fzf $HOME/.fzf
lnif $dotfiles/fzf.zsh $HOME/.fzf.zsh

# tmux
echo "Setting up tmux..."
lnif $dotfiles/tmux $HOME/.tmux
lnif $dotfiles/tmux.conf $HOME/.tmux.conf
lnif $dotfiles/tmux.conf.remote $HOME/.tmux.conf.remote
touch $HOME/.tmux.conf.local

# vim
echo "Setting up vim..."
lnif $dotfiles/vim $HOME/.vim
lnif $dotfiles/vimrc $HOME/.vimrc
touch $HOME/.vimrc.local

# git
echo "Setting up git..."
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/gitignore_global $HOME/.gitignore_global

# vifm
echo "Setting up vifm..."
lnif $dotfiles/vifm $HOME/.vifm

# mutt
echo "Setting up neomutt..."
lnif $dotfiles/mutt $HOME/.mutt

##
