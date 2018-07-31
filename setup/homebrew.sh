#!/bin/bash

# Install xcode-select if it is not currently available (homebrew dependency.)
command -v xcode-select >/dev/null 2>&1 || {
  echo >&2 "Installing xcode-select"; \
  xcode-select --install;
}

# Install Homebrew if it is not currently available.
command -v brew >/dev/null 2>&1 || {
  echo >&2 "Installing Homebrew"; \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
}

# Clean up all the things.
brew update
brew upgrade
brew prune
brew cleanup
brew doctor

###############################################################################
# GNU Utilities to Replace BSD Versions                                       #
###############################################################################

# There are GNU replacements for nearly all of the corresponding BSD utilities.
# I'm trying not to go nuts and will only add utilities when I find a use case.

# The basic file, shell, and text manipulation utilities of the GNU OS.
# https://www.gnu.org/software/coreutils/coreutils.html
brew install coreutils

# Install GNU find, locate, updatedb, and xargs.
# https://www.gnu.org/software/findutils/
brew install findutils --with-default-names

# GNU sed has several differences and supports -i.
# https://www.gnu.org/software/sed/
brew install gnu-sed --with-default-names

# GNU grep is significantly faster and supports -P.
# https://www.gnu.org/software/grep/
brew install grep --with-default-names

###############################################################################
# Updated Versions of Utilities on OSX                                        #
###############################################################################

# Replace VI with updated VIM build.
# https://www.vim.org/
brew install vim --with-override-system-vi

# Replace native git with updated version.
# https://git-scm.com/
brew install git

###############################################################################
# Install Packages                                                            #
###############################################################################

brew install wget
brew install htop
brew install links
brew install imagemagick
brew install cowsay
brew install zsh
brew install zsh-completions

# Web Services and Tools
brew install mysql
brew install node

###############################################################################
# Install Packages with Graphic Interface                                     #
###############################################################################

# Web browsers and clients.
brew cask install google-chrome
brew cask install firefox
brew cask install opera
brew cask install filezilla
brew cask install postman

# File storage.
brew cask install dropbox
brew cask install dropbox-encore

# Media.
brew cask install vlc
brew cask install spotify

# Collaboration.
brew cask install slack
brew cask install zoomus

# Development tools.
brew cask install phpstorm
brew cask install textwrangler
brew cask install sourcetree
brew cask install dash
brew cask install mysqlworkbench
brew cask install iterm2

###############################################################################
# Quick Look Displays                                                         #
###############################################################################

# Add color codded syntax highlighting for source doe files.
# https://github.com/anthonygelibert/QLColorCode
brew cask install qlcolorcode

# Display image dimensions and resolution in title of Quick Look display.
# https://github.com/Nyx0uf/qlImageSize
brew cask install qlimagesize

# Preview markdown syntax files.
# https://github.com/toland/qlmarkdown
brew cask install qlmarkdown

# Preview JSON files.
# http://www.sagtau.com/quicklookjson.html
brew cask install quicklook-json

# Restart quick look.
qlmanage -r
