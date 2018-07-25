#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# tmux
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

#bash history
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups

PS1='[\u@\h \W]\$ '
#Path additions
#User executables
export PATH=$PATH:~/bin

#Less for viewing wide queries
export PAGER=less
export LESS="-iMSx4 -FX"

# Alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#Tab title current directory
#PROMPT_COMMAND='echo -n -e "\033]0;`basename $PWD`\007"'
#Tab title vim opened file
#function vi { echo -n -e "\033]0;`basename $PWD`/\"$1\"\007" ; vim $1 ;}

# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}                                                                                                                                                             
#Prompt
export PS1="[\[\033[0;35m\]\t\[\033[0m\]] \u@\h:\[\033[0;36m\]\w\[\033[0m\] \[\033[0;33m\]\$(parse_git_branch) \n\[\033[0m\]$ "

#Python Virtual Environment
source ~/.virtualenv/venv3/bin/activate

#medleydb
#export MEDLEYDB_PATH="/home/cfahy/medleydb/Database/"

#Store last directory
declare -r PROMPT_COMMAND='printf %s "$PWD" > ~/.lastdir'
#Init in last directory
cd "$(<~/.lastdir)"

# Python
export PYTHONSTARTUP=/home/colin/.pystartup
# matplotlib
#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/Cellar/libpng/1.5.18/lib/:$DYLD_FALLBACK_LIBRARY_PATH


# torch7
#. /home/colin/packages/torch/install/bin/torch-activate

# Python
# export PATH="/home/colin/miniconda3/bin:$PATH"
