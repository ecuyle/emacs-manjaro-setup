#!/usr/bin/bash

# Install latest emacs
sudo pacman -Syy emacs

# Install Source Code Pro font
cd ~
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

# Run emacs for setup
emacs --insecure

# Copy over my personal .spacemacs file for configs
cp ~/.spacemacs ~/.spacemacs.bak
cp ./.spacemacs ~/.spacemacs

# Re-run emacs to install custom .spacemacs configs
emacs --insecure
