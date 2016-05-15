#!/bin/bash
echo "... starting bootstrapping"

# Clone and install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Install Homebrew (http://brew.sh)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update Homebrew
brew update

echo "... before we continue, run 'brew bundle install' in the requirements folder"
echo "... press enter to contine"
read

# install brew taps, needs to be fixed properly later
#while read in; do brew tap "$in"; done < Taps

# Install brews
#brew install $(cat requirements/brew_pkg.txt | grep -v "#")

# Install casks
#brew cask install $(cat Caskfile|grep -v "#")


# Set standard settings
source 'dotfiles.sh'
source 'osx_settings.sh'

# Install pip packages
pip3 install -r requirements/pip3.txt

echo "... done bootstrapping"