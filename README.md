# My dotfiles

Dotfiles are located in `dotfiles` folder, installation process is done by `install` script in the
root folder of the repository. `scripts` folder contain platform specific installation logic and
some additional utilities.

## Installation

- If you are on macOS, then first run `xcode-select --install` to install command line tools.
- Run `./install-dotfiles.sh` to link dotfiles.
- Run `./install-apps.sh` to install apps with brew and Python 3 packages.
