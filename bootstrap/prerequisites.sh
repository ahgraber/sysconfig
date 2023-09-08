#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

set -o errexit
# set -o nounset
set -o pipefail
# set -o xtrace

NC='\033[0m' # No Color
BLACK='\033[0;30m'
GRAY='\033[1;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;96m'
WHITE='\033[1;97m'

black() { printf "%b" "${BLACK}${1}${NC}"; }
red() { printf "%b" "${RED}${1}${NC}"; }
green() { printf "%b" "${GREEN}${1}${NC}"; }
yellow() { printf "%b" "${YELLOW}${1}${NC}"; }
blue() { printf "%b" "${BLUE}${1}${NC}"; }
purple() { printf "%b" "${PURPLE}${1}${NC}"; }
cyan() { printf "%b" "${CYAN}${1}${NC}"; }
white() { printf "%b" "${WHITE}${1}${NC}"; }

colorize() {
  usage() {
    cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [<color> <text>] [-h | --help ] [--show]

  Colorize requested text with 'printf'.
  Note: $(basename "${BASH_SOURCE[0]}") does not add a newline at the end (i.e., it acts as standard 'printf')

Options:
  color:            red, yellow, green, cyan, blue, purple, black, white, gray/grey
  -h | --help       show this help and exit
  --show            print sample of color options

Example: '$(basename "${BASH_SOURCE[0]}") "blue" "I'm blue da ba dee da ba daa.\n"'
EOF
    return
  }

  color="$1"
  text="$2"

  [[ -z "$color" ]] && usage
  case $color in
    "-h" | "--help") usage ;;
    "--show")
      for _color in red yellow green cyan blue purple black white; do
        printf "%s" "$(basename "${BASH_SOURCE[0]}"): "
        eval "${_color} '\"${_color}\" \"The quick brown fox jumps over the lazy dog.\\\n\"\n'"
      done
      ;;
    "black") black "${text}" ;;
    "gray"|"grey") gray "${text}" ;;
    "red") red "${text}" ;;
    "green") green "${text}" ;;
    "yellow") yellow "${text}" ;;
    "blue") blue "${text}" ;;
    "purple") purple "${text}" ;;
    "cyan") cyan "${text}" ;;
    "white") white "${text}" ;;
    *) printf "%b" "${text}" ;;
  esac
}

ask() { colorize blue "${1}"; }  # queries are followed by 'read' command; do not need newline
tell() { colorize green "${1}\n"; }
warn() { colorize yellow "${1}\n"; }
yell() { >&2 colorize red "${1}\n"; }  # redirect to stderr

#
#--- prerequisites -----------------------------------------------------------
#
# Ensure Apple's command line tools are installed
check_xcode() { xcode-select -p 2>&1; }
err_msg="xcode-select: error:"
if [[ $(check_xcode) == *"$err_msg"* ]]; then
  tell "Installing xcode ..."
  xcode-select --install
  while [[ $(check_xcode) == *"$err_msg"* ]]; do sleep 10; done;
else
  tell "Xcode already installed. Skipping."
fi

# Ensure x86 compatibility layer is installed
if [[ "$(arch)" == "arm64" ]] && [[ ! -f /Library/Apple/usr/share/rosetta/rosetta ]]; then
  tell "Installing Rosetta2 compatibility layer ..."
  softwareupdate --install-rosetta --agree-to-license
  while [[ ! "$(pkgutil --pkgs | grep Rosetta)" == "com.apple.pkg.RosettaUpdateAuto" ]]; do sleep 10; done;
else
  tell "Rosetta2 already installed. Skipping."
fi

# # install homebrew & packages if they don't exist
# tell "Checking homebrew installation"
# if [[ -n $(command -v brew) || -f /opt/homebrew/Homebrew/bin/brew || -f /usr/local/Homebrew/bin/brew ]]; then
#   tell "Homebrew installation found.  Checking packages ..."
# else
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi
# [[ -n $(command -v bat) ]] || brew install bat
# [[ -n $(command -v direnv) ]] || brew install direnv
# [[ -n $(command -v eza) ]] || brew install eza
# [[ -n $(command -v fd) ]] || brew install fd
# [[ -n $(command -v git) ]] || brew install git
# [[ -n $(command -v task) ]] || brew install go-task
# [[ -n $(command -v jq) ]] || brew install jq
# [[ -n $(command -v vivid) ]] || brew install vivid
# [[ -n $(command -v yq) ]] || brew install yq
# # [[ -n $(command -v zsh) ]] || brew install zsh

# # install fonts
# mkdir -p "$HOME/Library/Fonts"

# # meslo nf
# if ! ls ~/Library/Fonts/Meslo* &> /dev/null; then
#   tell "Installing Meslo NF to ~/Library/ ..."
#   cp ./font/*.ttf "$HOME/Library/Fonts"
# fi

# # install mambaforge
# # brew install --cask mambaforge
# if [[ -z $(command -v conda) ]] && [[ ! -f "$HOME/mambaforge/bin/conda" ]]; then
#   tell "Installing mambaforge ..."
#   curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
#   bash "Mambaforge-$(uname)-$(uname -m).sh" -b -f -p "$HOME/mambaforge"
#   rm "Mambaforge-$(uname)-$(uname -m).sh"
# fi
