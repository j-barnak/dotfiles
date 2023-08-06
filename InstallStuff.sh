#!/usr/bin/sh

sudo apt install -y build-essential ripgrep curl fd-find exa fzf zsh stow ninja-build gettext unzip curl libssl-dev libfuse2 && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash && \
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
