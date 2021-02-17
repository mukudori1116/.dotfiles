# less
export PAGER="less"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

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

# starship (prompt)
if ! (type "starship" > /dev/null 2>&1); then
    curl -fsSL https://starship.rs/install.sh | bash
fi
eval "$(starship init zsh)"

# cargo
export PATH=~/.cargo/bin:$PATH


