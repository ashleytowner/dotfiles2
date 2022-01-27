#!/bin/zsh

# Handle commandline args
while [[ $# -gt 0 ]]
do
    case $1 in
        --skip-packages)
            SKIP_PACKAGES=true
            shift
            ;;
        --skip-submodules)
            SKIP_SUBMODULES=true
            shift
            ;;
        --skip-remote)
            SKIP_REMOTE=true
            shift
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
    esac
done

# Make sure we are in the correct directory
basedir=$(dirname "$0")

pushd "$basedir"

if [ ! $SKIP_REMOTE ]; then

  # Install homebrew
  if [ ! $SKIP_PACKAGES ]; then
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
  fi

  if [ ! $SKIP_SUBMODULES ]; then
    # Install submodules
    git submodule update --init
  fi
fi

stow_dirs=("${(@f)$(cat .stowable)}")

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
