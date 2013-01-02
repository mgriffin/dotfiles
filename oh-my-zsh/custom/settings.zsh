export LC_ALL=en_IE.utf-8
export LANG=en_IE.utf-8
export LANGUAGE=en_IE.utf-8

export VISUAL=vim
export EDITOR=vim
export PAGER="less -E -X"

if [ -d $HOME/bin ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d $HOME/.gems/bin ] ; then
  PATH="$HOME/.gems/bin:$PATH"
fi

export PATH

# export HISTSIZE=200000
# export SAVEHIST=200000
# setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY   # append history list to the history file (important for multiple parallel zsh sessions!)
setopt SHARE_HISTORY        # import new commands from the history file also in other zsh-session
setopt EXTENDED_HISTORY     # save each command's beginning timestamp and the duration to the history file
setopt HIST_IGNORE_ALL_DUPS # If  a  new  command  line being added to the history
                            # list duplicates an older one, the older command is removed from the list
setopt HIST_IGNORE_SPACE    # remove command lines from the history list when
                            # the first character on the line is a space
# set a huge history... doesn't seem to affect performance at all
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$((HISTSIZE/2))

export GEM_HOME="$HOME/.gems"
export GEM_PATH="$GEM_HOME:/usr/lib/ruby/gems/1.8"
