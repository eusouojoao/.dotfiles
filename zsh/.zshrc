# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(pyenv init -)"
#eval "$(dircolors -b /etc/DIR_COLORS)"
export PATH=$HOME/Mathematica/bin:$HOME/bin:$HOME/.local/bin:$PATH
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export DOTFILES=$HOME/.dotfiles
export STOW_FOLDERS=alacritty,dunst,i3,mpd,mpv,ncmpcpp,nvim,picom,polybar,redshift,rofi,rofimoji,X,zathura,zsh,leftwm

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# User configuration
# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.cache/zsh/history

autoload -U colors && colors
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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

# Aliases
source $HOME/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
