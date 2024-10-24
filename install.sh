#!/usr/bin/env zsh

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
  git clone https://github.com/drvos/dotfiles.git $dotfiles
else
  cd $dotfiles && git pull
fi
echo "Installing/Updating antigen..."
curl -L -sS git.io/antigen > $dotfiles/zsh/antigen.zsh
mkdir -p $HOME/bin

# zsh
echo "Setting up zsh..."
lnif $dotfiles/zsh $HOME/.zsh
lnif $dotfiles/zsh/zshrc $HOME/.zshrc
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
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
touch $HOME/.tmux.conf.local

# vim
echo "Setting up vim..."
lnif $dotfiles/vim $HOME/.vim
lnif $dotfiles/vimrc $HOME/.vimrc
touch $HOME/.vimrc.local

# neovim
echo "Setting up neovim..."
mkdir -p $HOME/.config
lnif $dotfiles/nvim $HOME/.config/nvim

echo "Reload zsh config"
source $HOME/.zshrc
##
echo "Installation completed successfully. Do not forget to reload the configurations."
