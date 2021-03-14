# Anthiwat's Dotfiles

## Steps that are achieved

1. Clone repo into a hidden directory

```bash
# Use HTTPS
git clone https://github.com/AntCChaichot/My-Configuration.git ~/.dotfiles
```

2. Create symlinks in the Home directory to the real files in the repo. (Doing this will allow changes to be made on both files when saved)

!!! Warning: This may overwrite files !!!

```bash
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.profile ~/.profile
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/fish_variables ~/.config/fish/fish_variables
```

Remarks: no programs or plugins are installed yet

## Installing Programs and Plugins
For Debian-based distributions

```bash
# Install curl
sudo apt install get curl
```

### Zsh
For those without Z shell
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
### Fish for Debian 10 Buster (For others, check out fishshell.com)
```bash
# Install fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt update
sudo apt install fish

#Install Oh My Fish (optional)
curl -L https://get.oh-my.fish | fish
```

### Vim
```bash
sudo apt install vim
```
### Tmux
```bash
sudo apt install tmux
```
### Git
```bash
sudo apt install git
```

### Kite
### NERDTree
### lightline
