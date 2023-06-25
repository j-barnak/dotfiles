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
sudo apt install -y build-essential ripgrep curl \
                    fd-find zsh zsh-autosuggestions \
                    zsh-syntax-highlighting
```

## Installation

Run the following

```
stow --target=/home/jared/ neovim
stow --target=/home/jared/ zsh
```
