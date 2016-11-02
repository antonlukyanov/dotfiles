#!/usr/bin/env bash

apps_dev='/Applications/Разработка'
apps_internet='/Applications/Интернет'
apps_multimedia='/Applications/Мультимедиа'
apps_utilities='/Applications/Разное'

brew cask install 'sourcetree' --appdir=$apps_dev
brew cask install 'sublime-text' --appdir=$apps_dev
brew cask install 'spectacle' --appdir=$apps_utilities
brew cask install 'skype' --appdir=$apps_internet
brew cask install 'telegram' --appdir=$apps_internet
brew cask install 'magicprefs' --appdir=$apps_utilities
brew cask install 'dropbox' --appdir=$apps_internet
brew cask install 'google-drive' --appdir=$apps_internet
brew cask install 'djview'
brew cask install 'android-file-transfer' --appdir=$apps_dev
brew cask install 'torbrowser' --appdir=$apps_internet
brew cask install 'tunnelbear' --appdir=$apps_internet
brew cask install 'kdiff3' --appdir=$apps_dev
brew cask install 'lyx' --appdir=$apps_dev
brew cask install 'sequel-pro' --appdir=$apps_dev
brew cask install 'doxygen' --appdir=$apps_dev
brew cask install 'vlc' --appdir=$apps_multimedia
brew cask install 'transmission' --appdir=$apps_internet
brew cask install 'pycharm' --appdir=$apps_dev
brew cask install 'mactex'
brew cask install 'macdown' --appdir=$apps_dev
brew cask install 'java'
brew cask install 'jabref' --appdir=$apps_dev
brew cask install 'the-unarchiver' --appdir=$apps_utilities

brew tap caskroom/fonts
brew cask install 'font-source-code-pro'

brew cask cleanup
