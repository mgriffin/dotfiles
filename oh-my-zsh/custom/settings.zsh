export LC_ALL=en_IE.utf-8
export LANG=en_IE.utf-8
export LANGUAGE=en_IE.utf-8

export VISUAL=vim
export EDITOR=vim
export PAGER="less -E"

if [ -d $HOME/bin ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d $HOME/.gems/bin ] ; then
  PATH="$HOME/.gems/bin:$PATH"
fi

export PATH

export HISTSIZE=2000
export SAVEHIST=2000
