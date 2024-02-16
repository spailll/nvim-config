# nvim-config

## Setup
First, install neovim:
```
$ sudo apt install neovim
```
To setup vim-plug (so plugins work) run:
```
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Make sure to run the command
```
$ sudo apt install exuberant-ctags
```
So that the tagbar plugin works properly.
After this, add init.vim to the folder ```~/.config/nvim/```. 
Open nvim, and run ```:PlugInstall```.
If it is wanted, go into the ~/.bashrc file and add the line ```alias vi="nvim"``` so that nvim runs instead of vim.
