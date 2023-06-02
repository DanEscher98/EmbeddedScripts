set fish_greeting
# /home/dany98/.local/share/omf/themes
# starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# sudo blkid -o list
# Alternate method: sudo mount /dev/sda6 /media/dany98
if not findmnt /dev/sda6 >/dev/null
    udisksctl mount -b /dev/sda6
end
#cd /media/dany98/Shared/Working

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /home/dany98/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# export PATH="/home/dany98/Documents/Coding/Scripts/Spells/:$PATH"
set GOPATH $HOME/go/bin
set -gx VCPKG_ROOT $VCPK_ROOT /home/dany98/vcpkg/
set -gx PYTHONPATH $PYTHONPATH /home/dany98/miniconda3/lib/python3.9/
set -gx PATH $PATH /home/dany98/Working/Scripts/Spells/
set -gx PATH $PATH /home/dany98/.cargo/bin/
set -gx PATH $PATH /home/dany98/.local/bin/
set -gx PATH $PATH /home/dany98/Packages/emsdk
set -gx PATH $PATH /home/dany98/Packages/emsdk/upstream/emscripten
set -gx PATH $PATH /home/dany98/Packages/emsdk/node/14.15.5_64bit/bin
set -gx PATH $PATH $GOPATH
set -g theme_nerd_fonts yes
set -x TERM xterm-256color
set -x LC_CTYPE en_US.UTF-8
set -g Working /media/dany98/Shared/Working

set -xg EDITOR nvim
set -gx PAGER less
set -g LESS_TERMCAP_mb '\e[1;32m'
set -g LESS_TERMCAP_md '\e[1;32m'
set -g LESS_TERMCAP_me '\e[0m'
set -g LESS_TERMCAP_se '\e[0m'
set -g LESS_TERMCAP_so '\e[01;33m'
set -g LESS_TERMCAP_ue '\e[0m'
set -g LESS_TERMCAP_us '\e[1;4;31m'

# alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'

set FLATPAK_ENABLE_SDK_EXT golang,haskell,llvm12,rust-stable,texlive
#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/dany98/.ghcup/bin # ghcup-env

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
#set -gx PATH $HOME/.cabal/bin $PATH /home/dany98/.ghcup/bin # ghcup-env

set GHTOKEN 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
fish_vi_key_bindings
#fish_default_key_bindings
alias fzf='fzf --height 50% --reverse'
#starship init fish | source
alias ls='exa'
alias bat='batcat'
alias tress='tree|less'
alias cls='clear && ls'
alias trans='trans -b'
source /usr/share/autojump/autojump.fish
alias jd=autojump
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/dany98/.ghcup/bin # ghcup-env

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

