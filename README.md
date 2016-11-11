# DDVIMRC
my  customized configuration file for vim.

## Installation
```bash
#!/bin/bash

# Install vim-plug [vim-plug](https://github.com/junegunn/vim-plug)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Clone ddvimrc
git clone https://github.com/ddcien/ddvim.git ~/.ddvim

# Make some directories
mkdir ~/.vim/plugged ~/.vim/backupdir ~/.vim/undodir

# Enable ddvim
# Please backup your original ~/.vimrc file !!!
echo "source ~/.ddvim/.vimrc" > ~/ddvimrc

# Install plugins
vim +PlugInstall

# Build YCM
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer
cd
```
Now it's ready for using
