#-- ~/.zsh/*.zsh 読み込み------------------------------
ZSHHOME="${HOME}/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
# global.zsh 環境に依存しない設定
    source "$ZSHHOME/global.zsh"
# alias.zsh  環境に依存しないAlias
    source "$ZSHHOME/alias.zsh"
# tools.zsh  ツールの設定
    source "$ZSHHOME/tools.zsh"
fi
#------------------------------------------------------

# --環境に依存する設定---------------------------------
# Alias
alias gcc="gcc-10"
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
if type "trash" > /dev/null 2>&1; then
    alias rm="trash"
fi

# Path
export PATH=/usr/local/v850-elf-gcc:$PATH

# iterm2
test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh" || true

# Haskell
if [ -e ~/.ghcup ]; then
    source ~/.ghcup/env
fi
