# Anthiwat's Dotfiles

##Steps that are achieved

1. Clone repo into a hidden directory

```bash
# Use HTTPS
git clone https://github.com/AntCChaichot/My-Configuration.git ~/.dotfiles
```

2. Create symlinks in the Home directory to the real files in the repo. (Doing this will allow changes to be made on both files when saved)

```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.profile ~/.profile
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

Remarks: no programs or plugins are installed yet

##Installing Programs and Plugins
For Debian-based distributions
###Oh my Zsh
For those without Z shell
```bash
#Install curl
sudo apt install get curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

###Vim
```bash
sudo apt install vim
```
###Tmux
```bash
sudo apt install tmux
```
###Git
```bash
sudo apt install git
```

###Kite
###NERDTree
###lightline
