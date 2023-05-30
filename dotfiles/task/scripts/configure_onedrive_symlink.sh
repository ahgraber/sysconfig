#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

set -o errexit
set -o nounset
set -o pipefail

tell "Configuring OneDrive integration ..."
tell ""
warn "This will back up your current ~/Desktop and ~/Documents folders and replace with links to OneDrive locations"
warn "NOTE: This implies you have already signed into OneDrive!"

# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"


onedrive_dir="$(/bin/ls "$HOME" | grep OneDrive)"
if [[ -d "$HOME/$onedrive_dir" ]]; then
  ask "Symlink OneDrive folders (yes/no)? [n] "
  read -r user_select
  user_select=${user_select:-"n"}
fi

if [[ "$user_select" =~ $yesexpr ]]; then
  if [[ -d "$HOME/.Desktop.old" ]] || [[ -d "$HOME/.Documents.old" ]]; then
    warn "WARNING: '.old' directories already exist"
    ask "Continue and overwrite (yes/no)? [n] "
    read -r overwrite
  fi
  # set default overwrite to "no"
  overwrite=${overwrite:-"n"}
  if [[ "$overwrite" =~ $yesexpr ]]; then
    tell "Overwriting current '.old' ..."
    sudo mv -f "$HOME/Desktop" "$HOME/.Desktop.old"
    sudo mv -f "$HOME/Documents" "$HOME/.Documents.old"
    tell "Symlinking OneDrive ..."
    sudo ln -Ffs "$HOME/$onedrive_dir/Desktop" "$HOME"
    sudo ln -Ffs "$HOME/$onedrive_dir/Documents" "$HOME"
    tell "If you are missing files or folders in Desktop or Documents after this, run:"
    tell "'mv -rf $HOME/.Desktop.old/* $HOME/Desktop'"
    tell "'mv -rf $HOME/.Documents.old/* $HOME/Documents'"
  fi
else
  tell "Retaining separate folders for user home ($HOME) and OneDrive."
fi

tell ""
