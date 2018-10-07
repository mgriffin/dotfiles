txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtrst='\[\e[0m\]'    # Text Reset

if [ -f ~/.git-prompt ]; then
  . ~/.git-prompt
fi

### Set up a sane prompt
### [11:52:32] mike:~/.dotfiles (git_stuff) $
PS1="[${txtgrn}\t${txtrst}] \u:${txtylw}\w${txtrst}\$(__git_ps1) \$ "

### aliases
alias l='ls -lFG'
alias ll='ls -alFG'
alias sb='source ~/.bashrc'
function msdate() { perl -e "print scalar localtime($1 / 1000) . \"\n\""; }

### git aliases
alias gf='git fetch'
alias gm='git merge origin/master'
alias gg='git grep'
### prune stale local branches
alias prune='git remote prune origin && git branch -vv | grep '\''origin/.*: gone]'\'' | awk '\''{print $1}'\'' | xargs git branch -d'

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

### set my editor
export EDITOR=vim

# Only run this if rbenv is installed
if command -v rbenv >/dev/null; then
  export PATH="$HOME/bin:$HOME/.rbenv/bin:/usr/local/sbin:$PATH"
  eval "$(rbenv init -)"
fi
if command -v nodeenv >/dev/null; then
  eval "$(nodenv init -)"
fi

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

#set up hub if it's installed
if command -v hub >/dev/null; then
  eval "$(hub alias -s)"
fi
