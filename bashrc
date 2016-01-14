txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtrst='\[\e[0m\]'    # Text Reset

if [ -f /opt/boxen/env.sh ]; then
  . /opt/boxen/env.sh
fi
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

### Set up a sane prompt
### [11:52:32] mike@sprokett:~/.dotfiles $
PS1="[${txtgrn}\t${txtrst}] \u@${txtred}\h${txtrst}:${txtylw}\w${txtrst} \$ "

### aliases
alias l='ls -lF --color=auto'
alias ll='ls -alF --color=auto'
alias sb='source ~/.bashrc'
alias pup="sudo puppet apply --modulepath=/home/mike/src/puppet/modules /home/mike/src/puppet/manifests/site.pp"

alias tinsight='phpunit -c /home/mike/apps/phpunit/insight.xml'
alias tframework='phpunit -c /home/mike/apps/phpunit/framework.xml'

alias herb='ssh -f hg -L 5901:localhost:5901 -L 5902:localhost:5902 -L 5903:localhost:5903 -L 5904:localhost:5904 -L 5905:localhost:5905 -L 5906:localhost:5906 -L 5907:localhost:5907 -L 5908:localhost:5908 -N'

### set a sane editor
export EDITOR=vim

### and put things in my path
export PATH=/home/mike/apps/bin:$PATH

### history settings
# set the history files to be much much bigger than the default
HISTFILESIZE=1000000
HISTSIZE=1000000
# append history instead of overwriting the file
shopt -s histappend
# set a time format with full date and time
HISTTIMEFORMAT='%F %T '
# ignore duplicate commands and ones that start with a space
HISTCONTROL=ignoreboth
# ignore those commands too
HISTIGNORE='ls:bg:fg:history'
# make multiline commands fit on one line
shopt -s cmdhist
# immediately write the command to history instead of waiting until the end of the session
PROMPT_COMMAND='history -a'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
