# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#-------------------------+-------------------------#
#                       THEME                       #
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=("bureau" "nanotech" "agnoster") # limit random candidates when ZSH_THEME="random"
#-------------------------+-------------------------#
#                AUTO-UPDATE CONFIG                 #
# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13 # change auto-update frequency (in days).

# CASE_SENSITIVE="true" # enable case-sensitive completion.
# HYPHEN_INSENSITIVE="true" # _ and - will be interchangeable. Case-sensitive completion must be off.
# DISABLE_MAGIC_FUNCTIONS="true" # enable if pasting URLs and other text is messed up.
# DISABLE_LS_COLORS="true" # to disable colors in ls.
# DISABLE_AUTO_TITLE="true" # enable to disable auto-setting terminal title.
# ENABLE_CORRECTION="true" # enable command auto-correction.
# DISABLE_UNTRACKED_FILES_DIRTY="true" # disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, much faster.
# ZSH_CUSTOM=/path/to/new-custom-folder # change custom folder other than $ZSH/custom?

#-------------------------+-------------------------#
#                      PLUGINS                      #
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python vi-mode)

# vi-mode
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{white} %f"
# INSERT_MODE_INDICATOR="%F{white}> %f"
export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

#-------------------------+-------------------------#
#                USER CONFIGURATION                 #

## agnoster custom
# VIRTUAL_ENV_DISABLE_PROMPT=true

# Status:
# - was there an error
# - am I root
# - are there background jobs?
# prompt_status() {
#   local -a symbols
#
#   [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}"
#   [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
#   [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}"
#
#   [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
# }
# Virtualenv: current working virtualenv
# prompt_virtualenv() {
#   if [[ -n "$VIRTUAL_ENV" ]]; then
#     prompt_segment green black ""
#   fi
# }
#
# prompt_context() {}
# prompt_dir() {
  #   prompt_segment blue $CURRENT_FG '%2c'
# }
# prompt_git() {
#   local ref dirty mode repo_path
#   repo_path=$(git rev-parse --git-dir 2>/dev/null)
#
#   if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
#     dirty=$(parse_git_dirty)
#     ref=$(git symbolic-ref HEAD 2>/dev/null) || ref="➦ $(git show-ref --head -s --abbrev | head -n1 2>/dev/null)"
#     if [[ -n $dirty ]]; then
#       prompt_segment yellow black
#     else
#       prompt_segment green black
#     fi
#
#     if [[ -e "${repo_path}/BISECT_LOG" ]]; then
#       mode=" <B>"
#     elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
#       mode=" >M<"
#     elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
#       mode=" >R>"
#     fi
#
#     setopt promptsubst
#     autoload -Uz vcs_info
#
#     zstyle ':vcs_info:*' enable git
#     zstyle ':vcs_info:*' get-revision true
#     zstyle ':vcs_info:*' check-for-changes true
#     zstyle ':vcs_info:*' stagedstr '✚'
#     zstyle ':vcs_info:git:*' unstagedstr '●'
#     zstyle ':vcs_info:*' formats ' %u%c'
#     zstyle ':vcs_info:*' actionformats ' %u%c'
#     vcs_info
#     echo -n "${ref/refs\/heads\// }${vcs_info_msg_0_%% }${mode}"
#   fi
# }

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#-------------------------+-------------------------#
#                      ALIASES                      #
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias omzsh="nvim ~/.oh-my-zsh"
alias zshrc="nvim ~/.zshrc"
alias zshu="source ~/.zshrc"
# alias nv = "nvim"
alias nvimrc="nvim ~/.config/nvim/lua/ahmed/"
. "$HOME/.cargo/env"

function gacp {
  git add . && git commit -m "$@" && git push
}
#-------------------------+-------------------------#
#                   NEOVIM PICKER                   #
alias nvsl="NVIM_APPNAME=nvim/LazyVim nvim"
alias nvsk="NVIM_APPNAME=nvim/Kickstart nvim"
alias nvsc="NVIM_APPNAME=nvim/NvChad nvim"
alias nvsa="NVIM_APPNAME=nvim/AstroNvim nvim"

function nvs() {
  items=(
    "default"
    "nvim/Kickstart"
    "nvim/LazyVim"
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
[[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh
