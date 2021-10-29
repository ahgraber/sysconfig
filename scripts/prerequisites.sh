#!/bin/zsh

# Ensure Apple's command line tools are installed
if ! command -v cc >/dev/null; then
  echo "Installing xcode ..."
  xcode-select --install
  sudo xcodebuild -license
else
  echo "Xcode already installed. Skipping."
fi

# install x86 compatibility layer
if [[ "$(arch)" = "arm64" ]]; then
    softwareupdate --install-rosetta --agree-to-license
fi

# install homebrew if they don't exist
echo "Checking homebrew installation"
[[ $(command -v brew) ]] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[[ $(command -v bat) ]] || brew install bat
[[ $(command -v direnv) ]] || brew install direnv
[[ $(command -v exa) ]] || brew install exa
[[ $(command -v fd) ]] || brew install fd
[[ $(command -v git) ]] || brew install git
[[ $(command -v jq) ]] || brew install jq
[[ $(command -v zsh) ]] || brew install zsh

# install fonts
mkdir -p ~/Library/Fonts

# meslo nf
echo "Installing Meslo NF to ~/Library/Fonts..."
cp ./font/*.ttf ~/Library/Fonts

# install hack nerd font
echo "Installing Hack Nerd Font to ~/Library/Fonts..."
curl -fsSL https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip > hackfont.zip
unzip hackfont.zip -d hackfont
cp hackfont/ttf/*.ttf ~/Library/Fonts
rm -rf hackfont.zip hackfont

# install awesome-terminal-fonts
echo "Installing awesome-terminal-fonts to ~/Library/Fonts..."
curl -fsSL https://github.com/gabrielelana/awesome-terminal-fonts/archive/refs/tags/v1.1.0.zip > termfont.zip
unzip termfont.zip -d termfont/
cp termfont/awesome-terminal-fonts-1.1.0/build/*.ttf ~/Library/Fonts
mkdir -p ~/.fonts; cp termfont/awesome-terminal-fonts-1.1.0/build/*.sh ~/.fonts
rm -rf termfont.zip termfont

# install mambaforge
# brew install --cask mambaforge
if ! command -v conda >/dev/null; then
  echo "Installing mambaforge..."
  curl -fsSL https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-MacOSX-$(uname -m).sh \
    -o mambaforge3.sh
  bash mambaforge3.sh -b
  rm mambaforge3.sh
  echo "mambaforge successfully installed!"
fi
