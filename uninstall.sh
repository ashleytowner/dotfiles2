#!/usr/bin/zsh

source .confirm.sh

# Make sure we are in the correct directory
basedir=$(dirname "$0")

pushd "$basedir"

stow_dirs=("${(@f)$(cat .stowable)}")

data_dirs=()
for d in $stow_dirs
do
  if [ -d "${XDG_DATA_HOME}/$d" ]; then
    data_dirs+="${XDG_DATA_HOME}/$d"
  fi
done

# Unstow everything that needs stowing
for d in $stow_dirs
do
  if confirm "Do you want to unstow ${d}?"; then
    stow -D $d
    echo "$d unstowed"
  fi
done

if [[ ${#data_dirs[@]} -gt 0 ]]; then
  echo "The following data directories are not directly installed by this"
  echo "configuration, but contain data relating to programs which are."
  echo
  for d in $data_dirs
  do
    if confirm "Do you want to delete ${d}?"; then
      rm -rf $d
      echo "Deleted $d"
    fi
  done
fi

echo "Successfully uninstalled. You will have to delete this repository manually."

popd

