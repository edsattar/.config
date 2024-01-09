# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -r /etc/resolv.conf ] && grep -q "nameserver" /etc/resolv.conf; then
    export winhost="$(grep nameserver /etc/resolv.conf | awk '{print $2}')"
fi

# Append to $PATH.
export PATH=$HOME/.local/bin:$PATH

# Path to oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Multipurpose CapsLock
# $ sudo apt install xcape
# setxkbmap -option ctrl:nocaps
# xcape -e 'Control_L=Escape'
# xmodmap -e "keycode 67 = XF86AudioPlay XF86AudioPause XF86AudioPlay XF86AudioPause"

#-------------------------+-------------------------#
#                       THEME                       #
ZSH_THEME="powerlevel10k/powerlevel10k"

#-------------------------+-------------------------#
#                AUTO-UPDATE CONFIG                 #
zstyle ':omz:update' mode auto # update automatically without asking

#-------------------------+-------------------------#
#                      PLUGINS                      #
plugins=(git python zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

#-------------------------+-------------------------#
#                USER CONFIGURATION                 #
#
# for bash like behavior on missing package
# sudo apt install command-not-found
source /etc/zsh_command_not_found

#-------------------------+-------------------------#
#                      ALIASES                      #
gacp() { git add . && git commit -m "$@" && git push }
gacpp() { git pull && git add . && git commit -m "$@" && git push }
cdls() { cd "$@" && ls; }

alias cd="cdls"
alias omzsh="nvim ~/.oh-my-zsh"
alias zshrc="cd ~/.local/config/ && nvim ~/.zshrc"
alias zshu="source ~/.zshrc"
alias vimrc="cd ~/.config/nvim/ && nvim"
alias vi="nvim"
# . "$HOME/.cargo/env"


#-------------------------+-------------------------#
#                   NEOVIM PICKER                   #
alias nvsz="NVIM_APPNAME=nvim/LazyVim nvim"
alias nvsl="NVIM_APPNAME=nvim/LunarVim nvim"
alias nvsk="NVIM_APPNAME=nvim/Kickstart nvim"
alias nvsc="NVIM_APPNAME=nvim/NvChad nvim"
alias nvsa="NVIM_APPNAME=nvim/AstroNvim nvim"

function nvs() {
  items=(
    "default"
    "nvim/Kickstart"
    "nvim/LazyVim"
    "nvim/LunarVim"
    "nvim/NvChad"
    "nvim/AstroNvim"
  )
  display_items=("${items[@]##*/}")
  selected=$(printf "%s\n" "${display_items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $selected ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $selected == "default" ]]; then
    config=""
  else
    config="nvim/$selected"
  fi
  NVIM_APPNAME=$config nvim $@
}
#-------------------------+-------------------------#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_TIME_FORMAT='%D{%I:%M %p}'
POWERLEVEL9K_BATTERY_STAGES='󰂎󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/ahmed/.bun/_bun" ] && source "/home/ahmed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
