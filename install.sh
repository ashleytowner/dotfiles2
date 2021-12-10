#!/bin/zsh

# Make sure we are in the correct directory
basedir=$(dirname "$0")

pushd "$basedir"

# Install homebrew
if [[ $(uname -s) = 'MacOS' || $(uname -s) = 'Darwin' && $(which brew > /dev/null) -gt 0 ]]; then
  echo "Homebrew not installed; Installing..."
  which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew installed; skipping"
fi

# Install packages
which brew > /dev/null && echo "Installing homebrew packages..."; brew bundle
which apt > /dev/null && echo "Installing apt packages..."; xargs sudo apt install <Aptfile
which npm > /dev/null && echo "Installing npm packages..."; xargs -I{} npm i -g {} <Npmfile

# Install submodules
git submodule update --init

# Install vimplug
echo "Installing vimplug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install starship
echo "Installing starship..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

stow_dirs=(bash ctags fzf git kitty nvim ranger starship taskwarrior tmux zsh)

# Stow everything that needs stowing
for d in $stow_dirs
do
  echo "Stowing ${d}..."
  stow $d
done

# Source zshrc
echo "Sourcing zshrc"
source ~/.config/zsh/.zshrc

popd
