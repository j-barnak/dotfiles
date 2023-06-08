# dotfiles

Dependencies:
* [Lua](https://www.lua.org/download.html)
* [LuaJIT](https://luajit.org/install.html)
* [nvm](https://github.com/nvm-sh/nvm)
* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#linux) (obviously)
* [CMake](https://cmake.org/download/)
* [Wezterm](https://wezfurlong.org/wezterm/install/linux.html#installing-on-ubuntu-and-debian-based-systems)
    * Make sure to install the debian package (i.e., `wezterm*.deb`)
    * Use the newest version as some options will break

Run the following:

```
sudo apt install -y build-essential nnn ripgrep fd-find zsh &&
echo "-# NNN Config
export NNN_FCOLORS="2136"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='t:preview-tui;v:_viu $nnn'
export NNN_USE_EDITOR=1" >> ~/.zshrc
```
## Neovim

Run the following

```
stow --target=/home/jared/ neovim
```
