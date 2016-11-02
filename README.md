# My dotfiles

Dotfiles are located in `dotfiles` folder, installation process is done by `install-dotfiles` script
in the root folder of the repository. `scripts` folder contain platform-specific installation logic
and some additional utilities.

## Installation

- If you are on macOS, then first run `xcode-select --install` to install command line tools.
- Run `./install-dotfiles` to link dotfiles.
- Run `./install-apps` to install apps with brew and Python 3 packages.

`install-dotfiles` script accepts two arguments: the first is the source directory which contains
dotfiles and the second is the destination directory where to link dotfiles. It can also be run
without arguments.`install-apps` script simply executes scripts in `scripts` folder.
