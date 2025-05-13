#
# ~/.bash_profile
#

#To set some user specific env variables
export EDITOR=nvim
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
#Some more env variables
export TEXMFHOME="$XDG_DATA_HOME"/texmf 
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export TEXMFCONFIG="$XDG_CONFIG_HOME"/texlive/texmf-config
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export LESSHISTFILE="-" #Dont save history for less program
#export PINENTRY_KDE_USE_WALLET=1

#To make rust and cargo complaint with XDG base dirs
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
#setup cargo and rustc
. "$XDG_DATA_HOME"/cargo/env

[[ -f ~/.bashrc ]] && . ~/.bashrc

