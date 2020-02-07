#!/usr/bin/bash

# Remove old dirs
rm -rf source-code-pro
rm -rf dotfile-spacemacs

# Install latest emacs
sudo pacman -Syy emacs

# Save current directory
CURR_DIR=$PWD

# Install Source Code Pro font
cd $CURR_DIR
git clone https://github.com/adobe-fonts/source-code-pro.git
cd source-code-pro
sudo cp ./TTF/* /usr/share/fonts
sudo cp ./OTF/* /usr/share/fonts

# Backups old emacs config files
cd ~
mv .emacs.d .emacs.d.bak
mv .emacs .emacs.bak

# Clone spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Copy over my personal .spacemacs file for configs
cd $CURR_DIR
git clone git@github.com:ecuyle/dotifle-spacemacs.git
cd dotfile-spacemacs
cp ~/.spacemacs ~/.spacemacs.bak
cp ./.spacemacs ~/.spacemacs

# Re-run emacs to install custom .spacemacs configs
emacs --insecure

# Remove old dirs
rm -rf source-code-pro
rm -rf dotfile-spacemacs
