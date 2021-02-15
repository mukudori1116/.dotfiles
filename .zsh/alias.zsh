# Alias
alias ls="ls"
alias ll="ls -l"
alias la="ls -a"
alias lll="ls -la"
alias grep="grep --color=auto"
alias rm="rm -i"
alias ez="vim ~/.zsh/.zshrc"
alias ta="tmux attach"
alias reload="source $HOME/.zsh/.zshrc"

# lsd
if (type "lsd" > /dev/null 2>&1) then;
    alias ls="lsd"
else
    if (type "cargo" > /dev/null 2>&1) then;
        cargo install lsd
        alias ls="lsd"
    fi
fi

# AWS
function instances {
  aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceName: (.Tags[] | select(.Key=="Name").Value), InstanceId, State: .State.Name, InstanceType, PublicDnsName}'
}

# simplepush
alias simplepush='(){curl https://api.simplepush.io/send/665F3J/$1}'

# neovim
if (type "nvim" > /dev/null 2>&1) then;
	alias vim="nvim"
fi
