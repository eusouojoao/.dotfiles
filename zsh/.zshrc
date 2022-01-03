# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(dircolors -b /etc/DIR_COLORS)"
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS=alacritty,dunst,i3,mpd,mpv,ncmpcpp,nvim,picom,polybar,redshift,rofi,rofimoji,X,zathura,zsh

# User configuration
# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.cache/zsh/history

autoload -U colors && colors

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

autoload -U compinit && compinit -u
zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# VI mode
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Plugins
source $HOME/Projects/git/etc/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/Projects/git/etc/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/Projects/git/etc/powerlevel10k/powerlevel10k.zsh-theme

# User set aliases
export COLOR_MODE='--color=auto'
alias grep=' grep ${COLOR_MODE}'
alias egrep='egrep ${COLOR_MODE}'
alias fgrep='fgrep ${COLOR_MODE}'
alias zgrep='zgrep ${COLOR_MODE}'
alias ls='ls ${COLOR_MODE}'
alias ll='ls -lh'
alias l='ls -lAh'
alias tree='tree -C'
alias less='less -R'
alias s="sudo pacman -S"
alias syu="sudo pacman -Syu"
alias rm="trash -v"
alias cp="cp -v"
alias z="zathura --fork"
alias RAM_USE="smem -t -k -c pss -P"
alias cat="bat"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias se="sudo -e"
alias yt-dlp-best="yt-dlp -q -i -c -f 'bestvideo,bestaudio' -o '%(title)s.%(ext)s'"
alias yt-dlp-audio="yt-dlp --split-chapters -q -i -c -f 'novideo,bestaudio' -o '%(title)s.%(ext)s'"
alias la="exa -la --icons"
alias lt="exa --tree --icons"
alias neoflex="neofetch --ascii_distro arch_old --colors 31 12 8 4 8 6"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
