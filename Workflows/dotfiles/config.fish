set fish_greeting
fish_vi_key_bindings

set PATH $PATH /usr/local/go/bin
set NPM_CONFIG_PREFIX ~/.npm/bin

set --local home_bin .local .cargo .npm go .wasmer .config/composer/vendor
for dir in (string split ' ' $home_bin)
  set -gx PATH $PATH $HOME/$dir/bin
end


set -gx DISPLAY (ROUTE.EXE  print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0


set -xg EDITOR vi
set -gx PAGER less

alias bat "batcat --style=plain"
alias tress="tree|less"
alias cls="clear && exa --color=always | column"
alias trans="trans --brief"
alias fzf="fzf --reverse --height=20"
alias python="python2"
alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
alias jupyter-lab='jupyter lab --ip (python3 -c "import subprocess; subprocess.run([\'hostname\', \'-I\'], text=True).stdout")'
alias yaegi="rlwrap yaegi"


zoxide init fish | source

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /home/deere-vm/.ghcup/bin # ghcup-env
set -gx PATH $PATH $HOME/Packages/bitbake/bin
set -g GHTOKEN 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
set -g GHJDTOK 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
set -g JAVA_HOME "/opt/jdk-18.0.1+10"
set -gx PATH $PATH $JAVA_HOME/bin

# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source
set -ga fish_user_paths /home/deere-vm/.nimble/bin

# Wasmer
export WASMER_DIR="/home/deere-vm/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
