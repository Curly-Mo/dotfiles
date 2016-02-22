# Aliases sourced by .bashrc

# ls
alias ls='ls -Gh --color=auto --group-directories-first'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ltr='ls -ltr'
alias lr='ls -ltu'


# raspi
alias pi='ssh -t pi@musinformatics.ddns.net screen -RR'


# python virtualenvs
alias personal='export PYTHONSTARTUP=/Users/cfahy/.pystartup_personal; source ~/.virtualenv/personal/bin/activate'

# sudo
alias pacman='sudo pacman'
