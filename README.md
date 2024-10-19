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

After the installation is finished, the tmux plugins can be installed with `PREFIX`+`I`.

## Font

https://github.com/JetBrains/JetBrainsMono
https://www.nerdfonts.com/
