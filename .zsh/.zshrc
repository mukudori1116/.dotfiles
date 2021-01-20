# Set up the prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}%n%{$reset_color%} at %{$fg[magenta]%}%M%{$reset_color%} in %{$fg[green]%}%~%{$reset_color%}
#> "
#setopt prompt_subst                                                                                                                     
#TMOUT=60
#TRAPALRM() {zle reset-prompt}
#RPROMPT="%F{green} %D{%Y-%m-%d %H:%M} %f"

setopt histignorealldups sharehistory

# starship (prompt)
eval "$(starship init zsh)"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Use modern completion system
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

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
#

# Alias
alias c=clear
alias ls="ls"
alias ll="ls -l"
alias la="ls -a"
alias lll="ls -la"
alias ls="lsd"
alias grep="grep --color=auto"
alias rm="rm -i"
alias ez="vim ~/.zsh/.zshrc"
alias ta="tmux attach"
alias reload="source $HOME/.zsh/.zshrc"
function instances {
  aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceName: (.Tags[] | select(.Key=="Name").Value), InstanceId, State: .State.Name, InstanceType, PublicDnsName}'
}
alias simplepush='(){curl https://api.simplepush.io/send/665F3J/$1}'
alias vim="nvim"
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
alias gcc="gcc-10"

# Environment variables
export PATH=~/.cargo/bin:$PATH
export PATH=~/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

# Anyenv
eval "$(anyenv init -)"

test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh" || true

# tmux
export TERM=xterm-256color
