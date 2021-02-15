# tmux
export TERM=xterm-256color

# fzf
if (type "fd" &> /dev/null) then;
    export FZF_DEFAULT_COMMAND='fd --type file'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
if (type "bat" &> /dev/null) && (type "rg" &> /dev/null); then
    export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
fi

# Cargo
if ! (type "cargo" > /dev/null 2>&1); then
    echo "Install Rust?(y/N): "
    if read -q; then
        curl https://sh.rustup.rs -sSf | sh
    fi
fi
export PATH=~/.cargo/bin:$PATH

# Haskell
if [ -e ~/.ghcup ]; then
    source ~/.ghcup/env
fi

#asdf
. /usr/local/opt/asdf/asdf.sh

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config



