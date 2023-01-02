# Thapanin's Dotfiles

## Steps that are achieved

1. Clone repo into a hidden directory

```bash
# Install git first (sudo apt install git)

# Use HTTPS
git clone https://github.com/AntCChaichot/.dotfiles.git
```

2. Install Programs and Plugins

For Debian-based distributions

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

### Zsh
For those without Z shell and ohmyzsh
```bash
# Install curl
sudo apt install get curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Vim
```bash
sudo apt install vim
```
### Tmux
```bash
sudo apt install tmux
```
### Kitty Terminal
```bash
sudo apt install kitty
```

### Vim Plugins
Create a directory for the plugins manually since not using a package manager
```bash
# lightline
mkdir -p ~/.vim/pack/lightline/start
git clone https://github.com/itchyny/lightline.vim.git ~/.vim/pack/lightline/start/lightline

# NERDTree
mkdir -p ~/.vim/pack/NERDTree/start
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/NERDTree/start/NERDTree
```

3. Create symlinks in the Home directory to the real files in the repo. (Doing this will allow changes to be made on both files when saved)
!!! Warning: This may overwrite files !!!

```bash
# For Fish
ln -sf ~/.dotfiles/fish_variables ~/.config/fish/fish_variables
ln -sf ~/.dotfiles/fish_functions/* ~/.config/fish/functions/

# For Zsh
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# For Bash
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.profile ~/.profile

# For git
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig

# For vim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc

# For tmux
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

# For kitty
ln -sf ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf
```

4. Change shell according to your preferences
```bash
sudo chsh -s $(which fish)
```

### For GNOME DE
5. Change themes, icons, and cursors in gnome tweaks

```bash
# Enable Gnome Extensions
sudo apt -y install gnome-shell-extensions gnome-tweaks chrome-gnome-shell

# Copy themes
mkdir -p ~/.themes
cp ~/.dotfiles/.themes/* ~/.themes

# Copy icons
mkdir -p ~/.icons
cp ~/.dotfiles/.icons/* ~/.icons
```

6. Change Swappiness to improve performance
```bash
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
```

7. Update alternatives for default applications
```bash
# For Vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100

# For Python
sudo update -alternatives --install /usr/bin/python python $(which python3) 30
sudo update -alternatives --install /usr/bin/python python $(which python2) 20
```
