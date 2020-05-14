#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install xcode-select if it is not currently available (homebrew dependency.)
command -v xcode-select >/dev/null 2>&1 || {
  echo >&2 "Installing xcode-select"; \
  xcode-select --install;
}

# Install Homebrew if it is not currently available.
command -v xcode-selectcommand -v brew >/dev/null 2>&1 || {
  echo >&2 "Installing Homebrew"; \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
}

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Remove stale lock files and outdated downloads
brew cleanup

# Check for any potiential problems
brew doctor

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

###############################################################################
# GNU Utilities to Replace BSD Versions                                       #
###############################################################################

# There are GNU replacements for nearly all of the corresponding BSD utilities.
# I'm trying not to go nuts and will only add utilities when I find a use case.

# The basic file, shell, and text manipulation utilities of the GNU OS.
# https://www.gnu.org/software/coreutils/coreutils.html
# Must add PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
brew install coreutils

# Install GNU find, locate, updatedb, and xargs.
# https://www.gnu.org/software/findutils/
# Must add PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
brew install findutils

# GNU sed has several differences and supports -i.
# https://www.gnu.org/software/sed/
# Must add PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
brew install gnu-sed

# GNU grep is significantly faster and supports -P.
# https://www.gnu.org/software/grep/
# Must add PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
brew install grep

# More utils looked interesting
# https://joeyh.name/code/moreutils/
brew install moreutils

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Unsure about these 
# brew install wget --with-iri
# brew install gnupg

###############################################################################
# Updated Versions of Utilities on macOS                                      #
###############################################################################

# Replace VI with updated VIM build.
# https://www.vim.org/
brew install vim

# Replace native git with updated version.
# https://git-scm.com/
brew install git

brew install tkdiff
k
###############################################################################
# Install Packages                                                            #
###############################################################################

brew install htop
brew install links
brew install imagemagick
brew install cowsay
# JFV: Not usig zsh
# brew install zsh
# brew install zsh-completions

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

###############################################################################
# Python and VS Code                                                          #
###############################################################################
# JFV added other items
brew install python3
brew cask install visual-studio-code
