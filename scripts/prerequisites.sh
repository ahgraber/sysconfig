#!/usr/bin/env bash

# Ensure Apple's command line tools are installed
check_xcode() { xcode-select -p 2>&1; }
err_msg="xcode-select: error:"
if [[ $(check_xcode) == *"$err_msg"* ]]; then
  echo "Installing xcode ..."
  xcode-select --install
  while [[ $(check_xcode) == *"$err_msg"* ]]; do sleep 10; done;
else
  echo "Xcode already installed. Skipping."
fi

# Ensure x86 compatibility layer is installed
if [[ "$(arch)" == "arm64" ]] && [[ ! -f /Library/Apple/usr/share/rosetta/rosetta ]]; then
  echo "Installing Rosetta2 compatibility layer"
  softwareupdate --install-rosetta --agree-to-license
  while [[ ! "$(pkgutil --pkgs | grep Rosetta)" == "com.apple.pkg.RosettaUpdateAuto" ]]; do sleep 10; done;
else
  echo "Rosetta2 already installed. Skipping."
fi

# install homebrew & packages if they don't exist
echo "Checking homebrew installation"
if [[ -n $(command -v brew) ]] || [[ -f /usr/local/Homebrew/bin/brew ]] || [[ -f /opt/homebrew/Homebrew/bin/brew ]]; then
  echo "Homebrew installed.  Checking packages..."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
[[ -n $(command -v bat) ]] || brew install bat
[[ -n $(command -v direnv) ]] || brew install direnv
[[ -n $(command -v exa) ]] || brew install exa
[[ -n $(command -v fd) ]] || brew install fd
[[ -n $(command -v git) ]] || brew install git
[[ -n $(command -v jq) ]] || brew install jq
[[ -n $(command -v jq) ]] || brew install vivid
# [[ -n $(command -v zsh) ]] || brew install zsh

# install fonts
mkdir -p "$HOME/Library/Fonts"

# meslo nf
if ! ls ~/Library/Fonts/Meslo* &> /dev/null; then
  echo "Installing Meslo NF to ~/Library/Fonts..."
  cp ./font/*.ttf "$HOME/Library/Fonts"
fi

# install mambaforge
# brew install --cask mambaforge
if [[ -z $(command -v conda) ]] && [[ ! -f "$HOME/mambaforge/bin/conda" ]]; then
  echo "Installing mambaforge..."
  curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
  bash "Mambaforge-$(uname)-$(uname -m).sh" -b -f -p "$HOME/mambaforge"
  rm "Mambaforge-$(uname)-$(uname -m).sh"
fi
