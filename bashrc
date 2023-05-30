txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtrst='\[\e[0m\]'    # Text Reset

[[ -f $HOME/.git-prompt ]] && . $HOME/.git-prompt

### Set up a sane prompt
### [11:52:32] mike:~/.dotfiles (git_stuff) $
PS1="[${txtgrn}\t${txtrst}] \u:${txtylw}\w${txtrst}\$(__git_ps1) \$ "

### set my editor
export EDITOR=vim

### aliases
alias l='ls -lFG'
alias ll='ls -alFG'
alias sb='source $HOME/.bashrc'

### git aliases
alias gf='git fetch'
alias gm='git merge origin/$(git head)'
alias gg='git grep'
### prune stale local branches
alias prune='git remote prune origin && git branch -vv | grep '\''origin/.*: gone]'\'' | awk '\''{print $1}'\'' | xargs git branch -d'

### taskwarrior aliases
alias in='task add +in'

# Add tab completion for SSH hostnames based on $HOME/.ssh/config, ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

[[ -f $HOME/.bashrc_functions ]] && . $HOME/.bashrc_functions

# Only run this if rbenv is installed
if [[ -d $HOME/.rbenv ]]; then
  PATH="$HOME/.rbenv/bin:$PATH"
fi
if command -v rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi
if command -v nodeenv >/dev/null; then
  eval "$(nodenv init -)"
fi

if [[ -d /opt/homebrew/bin/ ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

### set up paths properly in codespaces so that rbenv will work
if [[ -d /home/linuxbrew/.linuxbrew/bin/ ]]; then
  PATH="/home/linuxbrew/.linuxbrew/bin/:$HOME/.gem/bin:$PATH"
  export GEM_HOME=$HOME/.gem/
fi

if [[ -d /usr/local/opt/php@7.2 ]]; then
  PATH="/usr/local/opt/php@7.2/bin:/usr/local/opt/php@7.2/sbin:$PATH"
fi
export PATH="$HOME/bin:$PATH"

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
export PROMPT_COMMAND='history -a'
if [[ -d $HOME/.logs ]]; then
  export PROMPT_COMMAND='history -a; if [[ "$(id -u)" -ne 0 ]]; then echo "$(pwd) $(history 1)" >> $HOME/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
fi

LESS="--quit-if-one-screen --RAW-CONTROL-CHARS"
export LESS

[[ -f $HOME/.fzf.bash ]] && source $HOME/.fzf.bash
[[ -z GH_GH_PAT ]] && export GITHUB_TOKEN=$GH_GH_PAT
