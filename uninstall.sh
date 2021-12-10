#!/bin/zsh

# Make sure we are in the correct directory
basedir=$(dirname "$0")

pushd "$basedir"

# Uninstall vimplug
echo "Uninstalling vimplug..."
rm "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim

stow_dirs=(bash ctags fzf git kitty nvim ranger starship taskwarrior tmux zsh)

# Unstow everything that needs stowing
for d in $stow_dirs
do
  echo "Unstowing ${d}..."
  stow -D $d
done

popd
