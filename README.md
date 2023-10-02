# dotfiles

Tools and stuff:
* [Lua](https://www.lua.org/download.html)
* [LuaJIT](https://luajit.org/install.html)
* [zk](https://github.com/mickael-menu/zk)
* [nvm](https://github.com/nvm-sh/nvm)
* [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#linux)
* [CMake](https://cmake.org/download/)
* [Wezterm](https://wezfurlong.org/wezterm/install/linux.html#installing-on-ubuntu-and-debian-based-systems)
    * Make sure to install the debian package (i.e., `wezterm*.deb`)
    * Use the newest version as some options will break

Run the following:

```
sudo apt install -y build-essential ripgrep curl \
                    fd-find exa fzf zsh stow ninja-build 
                    gettext unzip curl libssl-dev wl-clipboard
```

## Installation

Run the following

```
stow --target=/home/jared/ home
```

## Misc.

When mapping a shortcut to launch wezterm, use:

```
wezterm start --always-new-process
```

For VNC, install `tigervnc-viewer`. Provided in the `InstallStuff.sh` script.
