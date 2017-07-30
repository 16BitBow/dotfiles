#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="gtk2"

[[ -f ~/.extend.profile ]] && . ~/.extend.profile

export PATH=$PATH:$HOME/.local/bin
export POWERLINE_COMMAND=powerline
export POWERLINE_CONFIG_COMMAND=powerline-config

# not sure why this doesn't just stick normally
xset +fp ~/.local/share/fonts/tamzen-font/bdf &
xset fp rehash &
