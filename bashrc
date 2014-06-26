### set up colors
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
bakgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

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
