# export PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# export PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Keep 1000 lines use history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZDOTDIR/.zsh_history

# Environment variables
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# PYTHONPATH
export PYTHONPATH="$HOME/.mypyutils:$PYTHONPATH"

# Pipenv
export  PIPENV_VENV_IN_PROJECT=true

# AmberTools
export  PYTHONPATH="/home/ryotaf/amber19/lib/python3.7/site-packages:$PYTHONPATH"
export  AMBERHOME="/home/ryotaf/amber19"
export  AMBERPREFIX="/home/ryotaf/amber19"
export  PATH="$AMBERHOME/bin":$PATH
export  LD_LIBRARY_PATH="$AMBERHOME/lib":$LD_LIBRARY_PATH

# GROMACS
export  GMXHOME="/usr/local/gromacs"
export  GMXBIN="$GMXHOME/bin"
export  GMXDLIB="$GMXHOME/lib64"
export  GMXMAN="$GMXHOME/share/man"
export  GMXDATA="$GMXHOME/share/gromacs"
export  PATH="$GMXBIN":$PATH
export  LD_LIBRARY_PATH="$GMXDLIB":$LD_LIBRARY_PATH
export  PKG_CONFIG_PATH="$GMXDLIB/pkgconfig":$PKG_CONFIG_PATH
export  MANPATH="$GMXBIN":$MANPATH

# Gamess
export  PATH="$HOME/gamess":$PATH

# Openbabel
export  PYTHONPATH="/usr/local/lib/python3.7/site-packages:$PYTHONPATH"
export  PYTHONPATH="/usr/local/lib/python3.7/site-packages/openbabel:$PYTHONPATH"

source "$HOME/.cargo/env"
