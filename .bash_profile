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
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

#xinit
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

#export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=qt6ct

#startx
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
