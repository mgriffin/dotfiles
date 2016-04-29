txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtrst='\[\e[0m\]'    # Text Reset

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
# from @keeran
alias convert_epochs="perl -Mposix -pe 's/ ([0-9]{10}) /POSIX::strftime( \" %Y-%m-%d %H:%M:%S \", gmtime($1))/eg'"
function msdate() { perl -e "print scalar localtime($1 / 1000) . \"\n\""; }

### set my editor
export EDITOR=vim

export PATH="$HOME/.rbenv/bin:/usr/local/sbin:$PATH"
eval "$(rbenv init -)"

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

#set up hub
eval "$(hub alias -s)"
