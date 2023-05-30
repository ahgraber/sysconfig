#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace

usage() {
  echo "Usage: $0 [-s SRC] [-d DEST]" 1>&2
  exit 1
}

SRC=""
DEST=""
while getopts ":s:d:" opt; do
  case "${opt}" in
    s) SRC=${OPTARG} ;;
    d) DEST=${OPTARG} ;;
    *) usage ;;
  esac
done

if [[ -z "$SRC" || -z "$DEST" ]]; then
  usage
fi

if [[ -z "$(command -v git)" ]]; then
  yell "Error: git command not found"
  exit 1
fi

# shellcheck disable=SC1091,SC2154

# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4";

if [ ! -d "$DEST" ]; then
  tell "Destination path does not exist. Cloning ..."
  mkdir -p "$DEST"
  git clone "$SRC" "$DEST"
else
  cd "$DEST"
  if [[ "$(git rev-parse --is-inside-work-tree)" == 'true' ]]; then
    if [[ -n "$(git status -s)" ]]; then
      # repo is unclean
      tell "Repository found, but unclean."
      ask "Stash changes and update (y/n)? [y] "
      read -r git_select
      git_select=${git_select:-"y"}
      if [[ "$git_select" =~ $yesexpr ]]; then
        tell "Stashing local changes (stash) ..."
        git stash
        tell "Updating (pull) ..."
        git fetch && git pull
        tell "Reverting local changes (stash pop) ..."
        git stash pop
      fi
    else
      tell "Updating ..."
      git fetch && git pull
    fi
  else
    yell "Destination path exists, but is not a git repository. ..."
    exit 1
  fi
fi
