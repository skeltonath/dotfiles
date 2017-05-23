#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim zshrc"           # list of files/folders to symlink in homedir

##########

# make sure git is installed
command -v git >/dev/null 2>&1 || { echo "git not installed.  Aborting." >&2; exit 1; }
command -v vim >/dev/null 2>&1 || { echo "vim not installed.  Aborting." >&2; exit 1; }

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

# install Vundle and plugins for vim
echo -n "Installing Vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git $dir/vim/bundle/Vundle.vim
echo -n "Installing vim plugins"
vim +PluginInstall +qall
