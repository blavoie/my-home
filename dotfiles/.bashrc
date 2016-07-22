# .bashrc

echo "* .bashrc: beginning"

# Source global definitions

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

###################################################################################################
# User specific aliases and functions
###################################################################################################

echo "* .bashrc: user specific aliases and functions"

### User aliases

alias update="sudo dnf update -y"
alias update-refresh="sudo dnf update --refresh -y"

alias aws.ips='aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output=text'

alias pretty-json='python -mjson.tool'
alias pretty-json-color='python -mjson.tool | pygmentize -l json'

### Color prompt

PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '

### Powerline

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi
