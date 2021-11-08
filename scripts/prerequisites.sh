#!/bin/zsh

# Ensure Apple's command line tools are installed
if [[ $(command -v cc) ]]; then
  echo "Xcode already installed. Skipping."
else
  echo "Installing xcode ..."
  xcode-select --install
  sudo xcodebuild -license
fi

# install rosetta2 x86 compatibility layer
if [[ "$(arch)" = "arm64" ]]; then
    softwareupdate --install-rosetta --agree-to-license
fi

# install homebrew & packages if they don't exist
echo "Checking homebrew installation"
if [[ $(command -v brew) ]] || [[ -f /usr/local/Homebrew/bin/brew ]] || [[ -f /opt/homebrew/Homebrew/bin/brew ]]; then
  echo "Homebrew installed.  Checking packages..."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
[[ $(command -v bat) ]] || brew install bat
[[ $(command -v direnv) ]] || brew install direnv
[[ $(command -v exa) ]] || brew install exa
[[ $(command -v fd) ]] || brew install fd
[[ $(command -v git) ]] || brew install git
[[ $(command -v jq) ]] || brew install jq
[[ $(command -v jq) ]] || brew install vivid
[[ $(command -v zsh) ]] || brew install zsh

# install fonts
mkdir -p "$HOME/Library/Fonts"

# meslo nf
echo "Installing Meslo NF to ~/Library/Fonts..."
cp ./font/*.ttf "$HOME/Library/Fonts"

# install hack nerd font
echo "Installing Hack Nerd Font to ~/Library/Fonts..."
curl -fsSL https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip > hackfont.zip
unzip hackfont.zip -d hackfont
cp hackfont/ttf/*.ttf "$HOME/Library/Fonts"
rm -rf hackfont.zip hackfont

# install awesome-terminal-fonts
echo "Installing awesome-terminal-fonts to ~/Library/Fonts..."
curl -fsSL https://github.com/gabrielelana/awesome-terminal-fonts/archive/refs/tags/v1.1.0.zip > termfont.zip
unzip termfont.zip -d termfont/
cp termfont/awesome-terminal-fonts-1.1.0/build/*.ttf "$HOME/Library/Fonts"
mkdir -p "$HOME/.fonts"; cp termfont/awesome-terminal-fonts-1.1.0/build/*.sh "$HOME/.fonts"
rm -rf termfont.zip termfont

# install mambaforge
# brew install --cask mambaforge
if [[ ! $(command -v conda) ]] && [[ ! -f "$HOME/mambaforge/bin/conda" ]]; then
  echo "Installing mambaforge..."
  curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
  bash Mambaforge-$(uname)-$(uname -m).sh -b -f -p "$HOME/mambaforge"
  rm Mambaforge-$(uname)-$(uname -m).sh
fi
