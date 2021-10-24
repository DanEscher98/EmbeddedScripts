
set fish_greeting
# starship init fish | source


if status is-interactive
    # Commands to run in interactive sessions can go here
end
cd ~/Working

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/dany98/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# export PATH="/home/dany98/Documents/Coding/Scripts/Spells/:$PATH"  
set -gx VCPKG_ROOT $VCPK_ROOT /home/dany98/vcpkg/
set -gx PYTHONPATH $PYTHONPATH /home/dany98/miniconda3/lib/python3.9/
set -gx PATH $PATH /home/dany98/Working/Scripts/Spells/
set -gx PATH $PATH /home/dany98/.cargo/bin/ 
set -gx PATH $PATH /home/dany98/.local/bin/
set -gx PATH $PATH /home/dany98/Packages/emsdk
set -gx PATH $PATH /home/dany98/Packages/emsdk/upstream/emscripten
set -gx PATH $PATH /home/dany98/Packages/emsdk/node/14.15.5_64bit/bin
set -g theme_nerd_fonts yes
set -x TERM xterm-256color
set -x LC_CTYPE en_US.UTF-8

set -xg EDITOR nvim

alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'

set FLATPAK_ENABLE_SDK_EXT golang,haskell,llvm12,rust-stable,texlive
#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/dany98/.ghcup/bin # ghcup-env

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/dany98/.ghcup/bin # ghcup-env

set GHTOKEN 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
fish_vi_key_bindings
#fish_default_key_bindings
alias fzf='fzf --height 50% --reverse'
#starship init fish | source
alias ls='exa'
