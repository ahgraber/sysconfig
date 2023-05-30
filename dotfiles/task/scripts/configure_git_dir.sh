#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

set -o errexit
set -o nounset
set -o pipefail

tell "Configuring git project directory ..."
tell ""
tell "If your ~/Documents are cloud-synced, it is recommended to keep version-control directories separate."

# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"

ask "Separate git repositories from Documents? (y/n)? [y] "
read -r git_select
git_select=${git_select:-"y"}
if [[ "$git_select" =~ $yesexpr ]]; then
  ask "Directory name for git repositories folder (to be located in $HOME) ['_code']: "
  read -r CODE_DIR
  CODE_DIR=${CODE_DIR:-"_code"}
  tell "Creating '$HOME/$CODE_DIR' directory"
  mkdir -p "$HOME/$CODE_DIR"

  # save CODE_DIR ~/.env
  touch "$HOME/.env"
  sed -i.bak '/^export CODE_DIR/d' "$HOME/.env" && rm -f "$HOME/.env.bak"
  echo "export CODE_DIR='$CODE_DIR'" >> "$HOME/.env"

else
  tell "Skipping git folder setup."
  warn "WARNING: if Desktop and Documents are cloud synced (iCloud, OneDrive, etc.),"
  warn "saving git repositories in ~/Desktop or ~/Documents may risk sync conflicts!"
  tell ""
fi

tell ""
