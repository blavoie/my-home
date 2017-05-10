# Home Sweet Home

Various stuff about my home directory : dotfiles, script, functions, aliases, public keys, etc.

# Installation Process 

## Checkout somewhere

mkdir -p ~/dev
cd ~/dev
git clone git@github.com:blavoie/my-home.git

## Backup current files and install

mv ~/bin ~/bin.bak
ln -s dev/my-home/bin/ bin

mv ~/.ssh/config ~/.ssh/config.bak
ln -s ~/dev/my-home/ssh/config ~/.ssh/config
chmod -R go-rwx ~/dev/my-home

mv ~/.bashrc ~/.bashrc.bak
ln -s ~/dev/my-home/dotfiles/.bashrc ~/.bashrc

mv ~/.bash_profile ~/.bash_profile.bak
ln -s ~/dev/my-home/dotfiles/bash_profile ~/.bash_profile

mv ~/.nanorc ~/.nanorc.bak
ln -s ~/dev/my-home/dotfiles/.nanorc ~/.nanorc

mv ~/.vimrc ~/.vimrc.bak
ln -s ~/dev/my-home/dotfiles/.vimrc ~/.vimrc

mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s ~/dev/my-home/dotfiles/.tmux.conf ~/.tmux.conf

mv ~/.functions ~/.functions.bak
ln -s ~/dev/my-home/dotfiles/.functions ~/.functions

mv ~/.dockerfunctions ~/.dockerfunctions.bak
ln -s ~/dev/my-home/dotfiles/.dockerfunctions ~/.dockerfunctions

mv ~/.tools ~/.tools
ln -s ~/dev/my-home/dotfiles/.tools ~/.tools


# Other nice projects that can inspire

https://github.com/michaelpq/home
https://github.com/usmanm/dotfiles

Or, simply search on github with following keywords: home, bin, dotfiles.

# TODO

- Create scripts to automate installation by desired parts.

