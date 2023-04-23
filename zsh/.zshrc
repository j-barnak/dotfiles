# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git 
    zsh-syntax-highlighting
    autojump
    tmux
)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh
# User configuration

# Aliases
alias ..="cd .."
alias todo="dooit"
alias cutter="/usr/local/bin/Cutter-v2.2.0-Linux-x86_64.AppImage"
alias p="zathura"
alias sound="sudo ~/.scripts/sound.sh"
alias xc="xclip -selection clipboard"
alias vim="nvim"
alias vi="nvim"
alias s="sioyek"

# If you leave vim in normal mode, then the cursor will remain a beam
_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
