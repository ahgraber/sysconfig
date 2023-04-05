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
# shellcheck disable=SC2317
yell() { >&2 colorize red "${1}\n"; }  # redirect to stderr

#
#--- install -----------------------------------------------------------------
#
# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4";

ask "Where should we configure 'sysconfig'? ['$HOME/_sysconfig']: "
read -r SYS_CONFIG
SYS_CONFIG="${SYS_CONFIG:-"$HOME/_sysconfig"}" && export SYS_CONFIG
ZSH_CONFIG="${ZSH_CONFIG:-"$SYS_CONFIG/dotfiles/zsh"}" && export ZSH_CONFIG

# save SYS_CONFIG and ZSH_CONFIG to ~/.env
touch "$HOME/.env"
sed -i.bak '/^export SYS_CONFIG/d' "$HOME/.env" && rm -f "$HOME/.env.bak"
echo "export SYS_CONFIG='$SYS_CONFIG'" >> "$HOME/.env"
sed -i.bak '/^export ZSH_CONFIG/d' "$HOME/.env" && rm -f "$HOME/.env.bak"
echo "export ZSH_CONFIG='$ZSH_CONFIG'" >> "$HOME/.env"

# check for SYS_CONFIG
if [[ ! -d "$SYS_CONFIG" ]]; then
  tell "Cloning into $SYS_CONFIG"
  git clone https://github.com/ahgraber/sysconfig.git "$SYS_CONFIG"
else
  if [[ "$(cd "$SYS_CONFIG"; git rev-parse --is-inside-work-tree)" == "true" ]]; then
    ask "Git repository found.  Update from source? (y/n)? [y] "
    read -r git_select
    git_select=${git_select:-"y"}
    if [[ "$git_select" =~ $yesexpr ]]; then
      tell "Updating (Will attempt to reapply any local changes)..."
      (
        cd "$SYS_CONFIG" || exit
        tell "Stashing local changes (stash) ..."
        git stash
        tell "Updating (pull) ..."
        git fetch && git pull
        tell "Reverting local changes (stash pop) ..."
        git stash pop
      )
    fi
    unset git_select
  else
    # shellcheck disable=SC2088 # tilde does not expand in quotes
    ask "$SYS_CONFIG already exists but is not a git repo.  Back up and overwrite (y/n)? [y] "
    read -r overwrite_select
    overwrite_select=${overwrite_select:-"y"}
    if [[ "$overwrite_select" =~ $yesexpr ]]; then
      tell "Backing ..."
      mv "$SYS_CONFIG" "$SYS_CONFIG.$(date +%Y%m%d)"
    else
      warn "Exiting without ..."
      exit 0
    fi
    unset overwrite_select
  fi
fi

cd "$ZSH_CONFIG" || exit

tell "Installing ..."
# shellcheck disable=SC1091
source "$SYS_CONFIG"/bootstrap/prerequisites.sh

### Note: if installed with Homebrew, completions should be detected automatically
# echo "Prefilling local ..."
# . ./scripts/completions.sh

# echo "Setting zsh as default shell.  This may require your user password"
# zsh_path=$(which zsh)
# [[ ! $(grep "${zsh_path}" /etc/shells) ]] && cat "${zsh_path}" >> /etc/shells
# chsh -s "${zsh_path}"

tell "Initializing ..."
# dotfiles=(aliases p10k.zsh zshenv zshrc)
dotfiles=(aliases p10k.zsh z4henv z4hrc)
for file in "${dotfiles[@]}"; do
  # copy files and replace "z4h" with "zsh"
  # if exists as file, back up
  [[ -f "$HOME/.${file/z4h/zsh}" ]] && mv "$HOME/.${file/z4h/zsh}" "$HOME/.${file/z4h/zsh}.$(date +%Y%m%d)"
  # if exists as link, unlink
  [[ -L "$HOME/.${file/z4h/zsh}" ]] && unlink "$HOME/.${file/z4h/zsh}"
  # make link
  ln -sf "$ZSH_CONFIG/$file" "$HOME/.${file/z4h/zsh}"
done

# copy/link direnvrc
if [[ -z "$(command -v direnv)" ]]; then
  ask "Direnv not found.  Configure anyway? (y/n)? [y] "
  read -r direnv_select
  direnv_select=${direnv_select:-"y"}
  if [[ "$direnv_select" =~ $yesexpr ]]; then
    mkdir -p "$HOME/.config/direnv"
  fi
  # if exists as file, back up
  [[ -f "$HOME/.config/direnv/direnvrc" ]] && mv "$HOME/.config/direnv/direnvrc" "$HOME/.config/direnv/direnvrc.$(date +%Y%m%d)"
  # if exists as link, unlink
  [[ -L "$HOME/.config/direnv/direnvrc" ]] && unlink "$HOME/.config/direnv/direnvrc"
  # make link
  ln -sf "$SYS_CONFIG/dotfiles/direnv/direnvrc" "$HOME/.config/direnv/direnvrc"
fi

# copy git config files
if [[ -f "$HOME/.gitconfig" ]]; then
  mv "$HOME/.gitconfig" "$HOME/.gitconfig.$(date +%Y%m%d)"
  cp "$SYS_CONFIG/dotfiles/git/gitconfig" "$HOME/.gitconfig"
fi

if [[ -f "$HOME/.gitattributes_global" ]]; then
  mv "$HOME/.gitattributes_global" "$HOME/.gitattributes_global.$(date +%Y%m%d)"
  cp "$SYS_CONFIG/dotfiles/git/gitattributes_global" "$HOME/.gitattributes_global"
fi

ask "Disconnect zshconfig from source repo? (y/n)? [y] "
read -r git_select
git_select=${git_select:-"y"}
if [[ "$git_select" =~ $yesexpr ]]; then
  rm -rf "$SYS_CONFIG/.git"
fi
unset git_select

tell "Restarting zsh with new ..."
exec zsh
