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
### [11:52:32] mike:~/.dotfiles (git_stuff) $
PS1="[${txtgrn}\t${txtrst}] \u:${txtylw}\w${txtrst}\$(__git_ps1) \$ "

### aliases
alias l='ls -lFG'
alias ll='ls -alFG'
alias sb='source ~/.bashrc'
alias pup="sudo puppet apply --modulepath=/home/mike/src/puppet/modules /home/mike/src/puppet/manifests/site.pp"

### set my editor
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
