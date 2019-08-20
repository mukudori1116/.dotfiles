## Environment variables
#set  LANG en_US.UTF-8
#set  LANGUAGE en_US.UTF-8
#set  LC_ALL en_US.UTF-8
#set  LC_MESSAGES en_US.UTF-8
#set  LANG en_US.UTF-8
#set  LANGUAGE en_US.UTF-8
#
## PYTHONPATH
#set -gx PYTHONPATH "$HOME/.mypyutils:$PYTHONPATH"
#
## Pipenv
#set -gx PIPENV_VENV_IN_PROJECT true
#
## AmberTools
#set -gx PYTHONPATH "/home/ryotaf/amber19/lib/python3.7/site-packages:$PYTHONPATH"
#set -gx AMBERHOME "/home/ryotaf/amber19"
#set -gx AMBERPREFIX "/home/ryotaf/amber19"
#set -gx PATH "$AMBERHOME/bin" $PATH
#set -gx LD_LIBRARY_PATH "$AMBERHOME/lib" $LD_LIBRARY_PATH
#
## GROMACS
#set -gx GMXHOME "/usr/local/gromacs"
#set -gx GMXBIN "$GMXHOME/bin"
#set -gx GMXDLIB "$GMXHOME/lib64"
#set -gx GMXMAN "$GMXHOME/share/man"
#set -gx GMXDATA "$GMXHOME/share/gromacs"
#set -gx PATH "$GMXBIN" $PATH
#set -gx LD_LIBRARY_PATH "$GMXDLIB" $LD_LIBRARY_PATH
#set -gx PKG_CONFIG_PATH "$GMXDLIB/pkgconfig" $PKG_CONFIG_PATH
#set -x MANPATH "$GMXBIN" $MANPATH
#
## Gamess
#set -gx PATH "$HOME/gamess" $PATH
#
## Openbabel
#set -gx PYTHONPATH "/usr/local/lib/python3.7/site-packages:$PYTHONPATH"
#set -gx PYTHONPATH "/usr/local/lib/python3.7/site-packages/openbabel:$PYTHONPATH"
#
## FragIt
#set -gx PYTHONPATH "/usr/local/lib/python3.7/site-packages/fragit:$PYTHONPATH"
#
## MOE
#set -gx MOE "/usr/local/moe"
#
## MOPAC
#set -gx LD_LIBRARY_PATH "/opt/mopac" $LD_LIBRARY_PATH
#alias mopac='/opt/mopac/MOPAC2016.exe'

# Alias
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias rm='rm -i'
alias mv='mv -i'
alias gs='git status'
alias c='clear'
alias clip='/mnt/c/Windows/System32/clip.exe'
alias cmd='/mnt/c/Windows/System32/cmd.exe'
alias pymol='/mnt/c/Windows/System32/cmd.exe /c start D:/Pymol/.venv/PyMOL.exe'
alias ef='vim ~/.config/fish/config.fish'
alias ev='vim ~/.vimrc'
alias eneov='vim ~/.config/nvim/init.vim'
alias choco='cmd /c choco'
alias tleap='tleap -f /home/ryotaf/amber19/dat/leap/cmd/leaprc.protein.ff14SB -f /home/ryotaf/amber19/dat/leap/cmd/leaprc.gaff2 -f /home/ryotaf/amber19/dat/leap/cmd/leaprc.water.tip3p'
alias ta="tmux a"
alias tn="tmux new -s"
alias vim="nvim"
alias vs='cmd /c "C:/Program Files/Microsoft VS Code/Code.exe"'
alias ls='lsd'

# Function
function reload
  source ~/.config/fish/config.fish
end

function cd
  builtin cd $argv; and ls
end

function instances
  aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceName: (.Tags[] | select(.Key=="Name").Value), InstanceId, State: .State.Name, InstanceType, PublicDnsName}'
end

# AWS completion
complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); ~/.local/bin/aws_completer; end)'

