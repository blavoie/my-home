# Home Sweet Home

Various stuff about my home directory : dotfiles, script, functions, aliases, public keys, etc.

# Installation Process

## Set destination

```
export HOMEDIR=~/dev/perso/my-home/
```

## Checkout

```
mkdir -p ~/dev/perso/
git clone git@github.com:${HOMEDIR}
```

## Backup current files and install

```
mv ~/bin ~/bin.bak
ln -s ${HOMEDIR}/bin/ ~/bin

mv ~/.ssh/config ~/.ssh/config.bak
ln -s ${HOMEDIR}/ssh/config ~/.ssh/config
chmod -R go-rwx ${HOMEDIR}

mv ~/.bashrc ~/.bashrc.bak
ln -sf ${HOMEDIR}/dotfiles/.bashrc ~/.bashrc

mv ~/.bash_profile ~/.bash_profile.bak
ln -sf ${HOMEDIR}/dotfiles/.bash_profile ~/.bash_profile

mv ~/.nanorc ~/.nanorc.bak
ln -sf ${HOMEDIR}/dotfiles/.nanorc ~/.nanorc

mv ~/.vimrc ~/.vimrc.bak
ln -sf ${HOMEDIR}/dotfiles/.vimrc ~/.vimrc

mv ~/.tmux.conf ~/.tmux.conf.bak
ln -sf ${HOMEDIR}/dotfiles/.tmux.conf ~/.tmux.conf

mv ~/.functions ~/.functions.bak
ln -sf ${HOMEDIR}/dotfiles/.functions ~/.functions

mv ~/.dockerfunctions ~/.dockerfunctions.bak
ln -sf ${HOMEDIR}/dotfiles/.dockerfunctions ~/.dockerfunctions

mv ~/.tools ~/.tools
ln -sf ${HOMEDIR}/dotfiles/.tools ~/.tools
```

# Other nice projects that can inspire

https://github.com/michaelpq/home
https://github.com/usmanm/dotfiles

Or, simply search on github with following keywords: home, bin, dotfiles.

# TODO

- Create scripts to automate installation by desired parts.
