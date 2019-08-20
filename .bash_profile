# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is export in /etc/profile; for exportting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# export PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# export PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

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

# FragIt
export  PYTHONPATH="/usr/local/lib/python3.7/site-packages/fragit:$PYTHONPATH"

# MOE
export  MOE="/usr/local/moe"

# MOPAC
export  LD_LIBRARY_PATH="/opt/mopac":$LD_LIBRARY_PATH
alias mopac='/opt/mopac/MOPAC2016.exe'
