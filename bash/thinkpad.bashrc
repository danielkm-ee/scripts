#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#export XDG_CURRENT_DESKTOP=KDE
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Autorun
# wal -q --theme base16-classic

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH=$PATH:$HOME/.config/polybar/scripts:$HOME/.scripts

export DOTFILES="$HOME/Documents/git-lab/dotfiles"
export BROWSER="firefox"
export WALLPAPERS="$HOME/Pictures/Wallpapers/Wallpapers"

export PATH="/home/danielkm/.local/texlive/2024/bin/x86_64-linux:$PATH"
export MANPATH="/home/danielkm/.local/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/danielkm/.local/texlive/2024/texmf-dist/doc/info:$INFOPATH"
export TEXMFHOME="/home/danielkm/.local/texlive/texmf-local"

alias lcnc-dev='source $HOME/Projects/linuxcnc-dev/scripts/rip-environment'

export PATH="$HOME/.local/bin:$PATH"

if [ -f ~/.dircolors ]; then
	eval "$(dircolors -b ~/.dircolors)"
fi

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

if [ -f ~/.bash_profile ]; then
	source ~/.bash_profile
fi


# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/danielkm/.miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/danielkm/.miniforge3/etc/profile.d/conda.sh" ]; then
#         . "/home/danielkm/.miniforge3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/danielkm/.miniforge3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# 
# if [ -f "/home/danielkm/.miniforge3/etc/profile.d/mamba.sh" ]; then
#     . "/home/danielkm/.miniforge3/etc/profile.d/mamba.sh"
# fi
# # <<< conda initialize <<<

# Settings
set -o vi

export STM32_PRG_PATH=/home/danielkm/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin

# keysight ads variables
export HPEESOF_DIR=/usr/local/ADS2026_Update1
export ADS_LICENSE_DIR=$HPEESOF_DIR/Licensing/2025.4/linux_x86_64
export ADS_LICENSE_FILE=$HPEESOF_DIR/Licensing/lic/23222765_20260112134129.lic
export PATH=$HPEESOF_DIR/bin:$PATH
export PATH=$ADS_LICENSE_DIR/bin:$PATH

