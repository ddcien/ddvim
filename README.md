# DDVIMRC

My customized configuration file for [Vim](http://www.vim.org/) and [Neovim](https://neovim.io/)

## Installation

1.  Install vim-plug [vim-plug](https://github.com/junegunn/vim-plug).
    Please follow the installation instructions in the home page [vim-plug](https://github.com/junegunn/vim-plug).

2.  Clone this repository to your home directory.

```sh
git clone https://github.com/ddcien/ddvim.git ~/.ddvim
```

3.  Edit the default configuration files of Vim and Neovim to use this one.
    This will flush the default configuration files, backup them on your own account.

```sh
echo "source ~/.ddvim/init.vim" > ~/.vimrc
echo "source ~/.ddvim/init.vim" > ~/.config/nvim/init.vim
```

4.  Install the plugins.

```sh
vim +PlugInstall
```

Now it's ready for enjoying.

## Update

You can update the repository manually.

```sh
cd ~/.ddvim
git pull --rebase
```

And you can update the plugins manually with the following command.

```sh
vim +PlugUpdate
```
