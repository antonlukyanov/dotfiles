#!/usr/bin/env bash

if test ! $(which brew)
then
    echo "--> Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo '    + installed'
else
    echo "ok: Homebrew is installed"
fi

brew update

brew install 'coreutils'
brew install 'zsh'
brew install 'mc'
brew install 'ruby'
brew install 'lua' --with-completion
brew install 'python'
brew install 'python3'
brew install 'python-markdown'
brew install 'imagemagick'
brew install 'mercurial'
brew install 'git'
brew install 'nmap'
brew install 'tree'
brew install 'wget'
brew install 'valgrind'
brew install 'smartmontools'
brew install 'cmake'
brew install 'htop-osx'
brew install 'cowsay'
brew install 'ponysay'
brew install 'xz'
brew install 'glib'
brew install 'gnutls'
brew install 'emacs' --with-cocoa --with-dbus --with-glib --with-gnutls --with-imagemagick
brew install 'ctags'
brew install 'homebrew/versions/gcc49'
brew install 'gdb'
brew install 'hledger'
brew install 'markdown'
brew install 'homebrew/dupes/openssh'

brew install 'homebrew/python/scipy' --with-python3
brew install 'homebrew/python/matplotlib' --with-python3 --with-pyqt5 --with-tex

brew install 'mysql'
brew install 'qt5' --with-docs --with-examples --with-mysql
brew install 'pyqt5'