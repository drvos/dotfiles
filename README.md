# dotfiles

[Volker Schering](https://volker-schering.de "voslog")

===

Installation
------------
The following tools are required:
- git
- curl
- tmux
- zsh
- fzf
- vim

The installation must be done in an activated zsh.
```sh
chsh -s `which zsh`
```

```sh
git clone https://github.com/drvos/dotfiles.git 
cd dotfiles
./install.sh
```
The configuration files are symlinked to the home directory.
