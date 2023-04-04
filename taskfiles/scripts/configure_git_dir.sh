#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

set -o errexit
set -o nounset
set -o pipefail

tell "Configuring git project directory ..."
tell ""
tell "If your ~/Documents are cloud-synced, recommend keeping version-control directories separate."

# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"

ask "Separate git repositories from Documents? (y/n)? [y] "
read -r git_select
git_select=${git_select:-"y"}
if [[ "$git_select" =~ $noexpr ]]; then
  tell "Skipping git folder setup."
  warn "WARNING: if Desktop and Documents are cloud synced (iCloud, OneDrive, etc.), saving git repositories in ~/Desktop or ~/Documents may risk sync conflicts!"
  tell ""
elif [[ "$git_select" =~ $yesexpr ]]; then
  ask "Please enter directory name for git repositories folder (to be located in $HOME) ['_Git']: "
  read -r git_dir
  git_dir=${git_dir:-"_Git"}
  tell "Creating '$HOME/$git_dir' directory"
  mkdir -p "$HOME/$git_dir"
fi

tell ""
