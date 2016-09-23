# .bash_profile

echo "* .bash_profile: beginning"

# Get the aliases and functions

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Get secure, modify umask

umask 0007



###################################################################################################
# User specific environment and startup programs
###################################################################################################

echo "* .bash_profile: user specific environment and startup programs"

### SSH Agent Stuff
# Taken from: http://stackoverflow.com/questions/18880024/start-ssh-agent-on-login

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

### Adding «Dropbox home»

DROPBOX_HOME=$HOME/Dropbox
export DROPBOX_HOME

### Adding user personnal bin directories to path

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

### System default JAVA HOME

JAVA_HOME=/etc/alternatives/java_sdk
export JAVA_HOME

### JetBrains PyCharm JDK

PYCHARM_JDK=/opt/jdk8
export PYCHARM_JDK

### JetBrains IntelliJ IDEA JDK

IDEA_JDK=/opt/jdk8
export IDEA_JDK

### JetBrains CLion JDK

CL_JDK=/opt/jdk8
export CL_JDK

### JetBrains WebStorm JDK

WEBIDE_JDK=/opt/jdk8
export WEBIDE_JDK

### JetBrains RubyMine JDK

RUBYMINE_JDK=/opt/jdk8
export RUBYMINE_JDK

### JetBrains DataGrip JDK

DATAGRIP_JDK=/opt/jdk8
export DATAGRIP_JDK

### Gradle

GRADLE_HOME=~/app/gradle
export GRADLE_HOME

PATH=$GRADLE_HOME/bin:$PATH
export PATH

### GOLANG

GOPATH=~/dev/go
export GOPATH

GOBIN=$GOPATH/bin/
export GOBIN

PATH=$PATH:$GOBIN
export PATH

### Oracle Environment

. ~/bin/env-oracle-common
. ~/bin/env-oracle-instantclient
#. ~/bin/env-oracle-client

### Python environment to Anaconda by default

. env-anaconda

### Outils d'administration du Cluster Hadoop

PATH=$PATH:/home/bl/cluster-hadoop
export PATH
