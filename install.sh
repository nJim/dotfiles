#!/usr/bin/env bash

####################
# This scripts copy .dotfiles from home/ dir into $HOME
#
# Intended use is for user to first clone dotfiles from github repo and then
# to run this script to copy dot files plus any other files of interest into
# users $HOME directory.
#
# First user mush have coppied files from repo using:
# git clone https://github.com/njim/dotfiles.git && cd dotfiles
#
# User must modify dot-src-file-list file for desired files,
# one file name per line, no comments or extra spaces/newlines.
#
# Script also Installs Homebrew Packages and configure macOS
# git autocompletion not yet enabled.
####################

# copy_exec function copies files from current directory "./home/."
# to $HOME dir. Then sources profile.
# If necessary, the rsync usage allows for files to be located on different server.

function copy_exec() {
  echo "Copy files into user's home";
  rsync --perms --executability --verbose \
        --files-from=dot-src-file-list ./home/. ~;
  source ~/.bash_profile;
}

# Beginning of script

curdir=$CWD;

# Give user chance to exit before scrip overwrites .files in $HOME.
if [ "$1" == "--force" -o "$1" == "-f" ]; then
        copy_exec;
else
        echo "dot-src-file-list contains:";
        cat dot-src-file-list;
        read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
        echo "";
        if [[ $REPLY =~ ^[Yy]$ ]]; then
                copy_exec;
	else 
		echo "Exiting without change";
		exit 1;
        fi;
fi;

unset copy_exec;

# Found this but not yet tried to use it.
# Download Git Auto-Completion
# curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ~/.git-completion.bash;

# All scripts located in setup dir
cd ./setup;
echo $PWD

# Run the Homebrew script
# Note that several places requires sudo password, not yet tried to run from sudo shell
./homebrew.sh | tee homebrew.log;

# Need to un-comment one of these 2 entries
# Have not yet tried to run these scripts so both # for now
# Run macOS script
#./osx.sh | tee osx.log;
#./macos.sh | tee macos.log;

cd $curdir;
unset curdir;
