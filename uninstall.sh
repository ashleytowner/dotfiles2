#!/bin/zsh

# Make sure we are in the correct directory
basedir=$(dirname "$0")

pushd "$basedir"

stow_dirs=("${(@f)$(cat .stowable)}")

data_dirs=()
for d in $stow_dirs
do
  if [ -d "${XDG_DATA_HOME}/$d" ]
  then
    data_dirs+="${XDG_DATA_HOME}/$d"
  fi
done

# Unstow everything that needs stowing
for d in $stow_dirs
do
  echo "Unstowing ${d}..."
  stow -D $d
done

if [[ ${#data_dirs[@]} -gt 0 ]]
then
  echo "Do you want to remove the following data directories? [Y/n]"
  for d in $data_dirs
  do
    echo "$d"
    read do_delete
    if [[ $do_delete = 'y' || $do_delete = 'Y' ]]
    then
      rm -rf $d
      echo "Removed $d"
    fi
  done
fi

echo "Successfully uninstalled. You will have to delete this repository manually."

popd

