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

#XAuthority
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#ICEauthority
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority

#Default wineprefix
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

#Qt theming
export QT_QPA_PLATFORMTHEME=qt6ct

#xinit
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

#openai codex
export CODEX_HOME="$XDG_CONFIG_HOME"/codex

#claude code
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME"/claude

#Autostart X on login
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
