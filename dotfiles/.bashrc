# .bashrc

#echo "* .bashrc: beginning"

# Source global definitions

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

for file in ~/.{bash_prompt,aliases,tools,functions,path,dockerfunctions,extra,exports,ul}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

### Color prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '

### Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

### Add root to use display, from Docker containers

xhost SI:localuser:root >/dev/null 2>&1

###################################################################################################
# User Specific Aliases and Functions
###################################################################################################

#echo "* .bashrc: user specific aliases and functions"

### User aliases

alias update="sudo dnf update -y"
alias update-refresh="sudo dnf update --refresh -y"

alias aws.ips='aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output=text'

alias pretty-json='python -mjson.tool'
alias pretty-json-color='python -mjson.tool | pygmentize -l json'

# Original command: for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r | less

alias swapped-processes='for file in /proc/*/status ; do awk '"'"'/VmSwap|Name/{printf $2 " " $3}END{ print ""}'"'"' $file; done | sort -k 2 -n -r | less'

### Powerline

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi
