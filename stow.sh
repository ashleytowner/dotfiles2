#!/bin/zsh
stow_dirs=(bash ctags fzf git kitty nvim ranger starship taskwarrior tmux zsh)

# Stow everything that needs stowing
for d in $stow_dirs
do
  echo "Stowing ${d}..."
  stow $d
done
