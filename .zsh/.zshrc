# Historyの重複を防ぐ＆シェル間で共有する
setopt histignorealldups sharehistory

# starship (prompt)
if ! (type "starship" > /dev/null 2>&1); then
    curl -fsSL https://starship.rs/install.sh | bash
fi
eval "$(starship init zsh)"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Use modern completion system
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# Completion
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


##############################
## zplug: zsh plugin manager##
##############################

if [ ! -e ~/.zplug ]; then
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# Plugins
zplug "mollifier/anyframe"
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_DISABLE_DOT=1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux 
zplug "junegunn/fzf", use:shell/key-bindings.zsh 
zplug "junegunn/fzf", use:shell/completion.zsh 
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
#---------------end use zplug----------------

# Alias
alias c=clear
alias ls="ls"
alias ll="ls -l"
alias la="ls -a"
alias lll="ls -la"

if (type "lsd" > /dev/null 2>&1) then;
    alias ls="lsd"
else
    if (type "cargo" > /dev/null 2>&1) then;
        cargo install lsd
        alias ls="lsd"
    fi
fi
alias grep="grep --color=auto"
alias rm="rm -i"
alias ez="vim ~/.zsh/.zshrc"
alias ta="tmux attach"
alias reload="source $HOME/.zsh/.zshrc"
function instances {
  aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceName: (.Tags[] | select(.Key=="Name").Value), InstanceId, State: .State.Name, InstanceType, PublicDnsName}'
}
alias simplepush='(){curl https://api.simplepush.io/send/665F3J/$1}'
if (type "nvim" > /dev/null 2>&1) then;
	alias vim="nvim"
fi
if (type "gcc-10" >/dev/null 2>&1) then;
	alias gcc="gcc-10"
fi


# Environment variables
export PATH=/usr/local/v850-elf-gcc:$PATH

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config

# Rust and Cargo
# install
if ! (type "cargo" > /dev/null 2>&1); then
    echo "Install Rust?(y/N): "
    if read -q; then
        curl https://sh.rustup.rs -sSf | sh
    fi
fi
export PATH=~/.cargo/bin:$PATH

# Anyenv
# anyenv install
if ! (type "anyenv" > /dev/null 2>&1); then
    echo "Install anyenv?(y/N): "
    if read -q; then
        git clone https://github.com/anyenv/anyenv ~/.anyenv
    fi
fi
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"


# tmux
export TERM=xterm-256color

# MacOS
if [ "$(uname)"=='Darwin' ]; then
    alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
    test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh" || true
    if ! (type "trash" > /dev/null 2>&1); then
        echo "Install trash?(y/N): "
        if read -q; then
            brew install trash
        fi
    fi
    if type "trash" > /dev/null 2>&1; then
        alias rm="trash"
    fi
fi
