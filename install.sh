#!/bin/zsh

# Install homebrew
if [ $(uname -s) = 'MacOS' ]; then
  which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages
which brew > /dev/null && brew bundle
which apt > /dev/null && xargs sudo apt install <Aptfile
which npm > /dev/null && xargs -I{} "npm list -g {} || npm i -g {}" <Npmfile

# Install submodules
git submodule update --init

# Install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Stow everything that needs stowing
stow *_s

# Source zshrc
source ./zsh_s/.config/zsh/.zshrc
