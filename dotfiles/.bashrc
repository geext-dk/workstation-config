
#
# USER-DEFINED
#

# PATH
PATH="$PATH:$HOME/Tools/go/bin"
PATH="$PATH:$HOME/Tools/nodejs/bin"
PATH="$PATH:$TEXDIR/bin/x86_64-linux"
if command -v yarn &> /dev/null; then
    PATH="$PATH:$(yarn global bin path)"
fi
export PATH

# TEX
export MANPATH="$TEXDIR/texmf-dist/doc/man:$MANPATH"
export TEXDIR="$HOME/Tools/texlive/2020"
export INFOPATH="$TEXDIR/texmf-dist/doc/info:$INFOPATH"

# GO
export GOPATH="$HOME/.local/share/go"

# EDITOR
export EDITOR=nvim

export XDG_CURRENT_DESKTOP=Unity

GRUVBOX_SH_PATH="$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"
if [ -e "$GRUVBOX_SH_PATH" ]; then
    source "$GRUVBOX_SH_PATH"
fi
