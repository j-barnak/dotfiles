# dotfiles

## Neovim

Run the following
```
cp -r `dotfiles/neovim/nvim` $HOME 
```

Dependencies:
* [Lua](https://www.lua.org/download.html)
* [LuaJIT](https://luajit.org/install.html)
* [nvm](https://github.com/nvm-sh/nvm)
* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#linux) (obviously)
* [CMake](https://cmake.org/download/)

Inside `nvim/lua/plugins/packer.lua`, run the following

```
:PackerSync
:PackerInstall
:PackerCompile
```

## Zsh

Run the following
```
cp -r `dotfiles/bash/* $HOME 
sudo apt install -y bash-completion fzf cmake build-essential \
                    ripgrep
```
