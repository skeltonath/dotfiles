#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles                  # dotfiles directory
olddir=$HOME/dotfiles_old           # old dotfiles backup directory
files="vimrc vim zshrc zsh_plugins" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo -n "Moving any existing dotfiles from ~ to $olddir"
    if [ -e ~/.$file ]
    then
        mv ~/.$file ~/dotfiles_old/
    fi
    echo -n "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install homebrew
echo -n "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install git
echo -n "Installing git"
brew install git

# install base16-shell
echo -n "Installing base16-shell"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# install antidote for zsh
echo -n "Installing antidote for zsh"
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# install Vundle and plugins for vim
echo -n "Installing Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git $dir/vim/bundle/Vundle.vim
echo -n "Installing vim plugins"
vim +PluginInstall +qall

# intall pyenv and latest version of python as default
echo -n "Installing pyenv"
brew install pyenv
echo -n "Install latest python"
pyenv install 3
pyenv global 3
