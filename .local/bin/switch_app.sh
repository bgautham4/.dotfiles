#!/usr/bin/env bash

function switch_app {
    # Try to change focus to specified application, but
    # dont launch if not found using jumpapp(1)
    jumpapp -c "$1" -wNC dummy 2> /dev/null
}

case "$1" in
    'terminal') switch_app 'Alacritty' ;;
    'browser')  switch_app 'Brave-browser' || switch_app 'firefox';;
    'pdfviewer') switch_app 'okular' ;;
    *) exit 1;;
esac


