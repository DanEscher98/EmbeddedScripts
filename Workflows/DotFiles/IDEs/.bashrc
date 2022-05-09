# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dany98/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dany98/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dany98/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dany98/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
#[ -f "/home/dany98/.ghcup/env" ] && source "/home/dany98/.ghcup/env" # ghcup-env
#[ -f "/home/dany98/.ghcup/env" ] && source "/home/dany98/.ghcup/env" # ghcup-env

FLATPAK_ENABLE_SDK_EXT=golang,haskell,rust-stable,llvm12,texlive
[ -f "/home/dany98/.ghcup/env" ] && source "/home/dany98/.ghcup/env" # ghcup-env
