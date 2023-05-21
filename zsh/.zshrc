# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# For NNN
export NNN_FCOLORS="d1b2e0"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Default editor to use for apps
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    zsh-syntax-highlighting
    autojump
)


source $ZSH/oh-my-zsh.sh
# User configuration

# Aliases
alias lg="lazygit"
alias rez="wezterm cli rename-workspace"
alias ..="cd .."
alias todo="dooit"
alias cutter="/usr/local/bin/Cutter-v2.2.0-Linux-x86_64.AppImage"
alias p="zathura"
alias sound="sudo ~/.scripts/sound.sh"
alias xc="xclip -selection clipboard"
alias vim="nvim"
alias vi="/usr/bin/vim"
alias sio="sioyek --new-window"

# If you leave vim in normal mode, then the cursor will remain a beam
_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

unsetopt beep

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Created by `pipx` on 2023-05-04 16:28:03
export PATH="$PATH:/home/jared/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
