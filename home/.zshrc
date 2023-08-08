# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Necessary Installations:
# * nvim
# * fzf
# * ripgrep
# * p10k
# * exa
# * nvm
# * zsh-syntax-highlighting.zsh
# * zsh-autosuggestions.zsh
# * autojump
# * wl-clipboard
# * sioyek
# * go

export LANG=en_US.UTF-8
export MANPAGER="/usr/local/bin/nvim -c 'Man!' -o -"
export EDITOR='nvim'
export DIFFPROG='nvim -d'
export FZF_DEFAULT_COMMAND='rg --no-messages --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--no-separator --layout=reverse --inline-info"

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"       # The path to the history file.
HISTSIZE=1000000000                             # The maximum number of events to save in the internal history.
SAVEHIST=1000000000                             # The maximum number of events to save in the history file.

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt glob_dots

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

unsetopt autocd beep notify
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jared/.zshrc'

# Key Bindings
bindkey "^h" backward-word
bindkey "^l" forward-word
bindkey "^j" kill-word

autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'

# Aliases
alias lsv="live-server"
alias vi="/usr/bin/vim"
alias fuck="sudo /home/jared/.scripts/sound.sh"
alias ls="exa"
alias ll='exa --long --all --group-directories-first --git'
alias wl='wl-copy'
alias vim='nvim'
alias sio="sioyek"
alias gp="git push"
alias ..='cd ..'

# Tab Selection Menu with Colors
# Case-Insensitive Autocomplete
autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Plugins
source /home/jared/Installs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/jared/Installs/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fancy Ctrl-z
# https://github.com/mdumitru/fancy-ctrl-z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -s /home/jared/.autojump/etc/profile.d/autojump.sh ]] && source /home/jared/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
