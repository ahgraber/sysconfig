#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

set -o errexit
set -o nounset
set -o pipefail

echo "############################################################"
echo "###   Configuring OneDrive integration...                ###"
echo "############################################################"
echo ""
echo "This will back up your current ~/Desktop and ~/Documents folders"
echo "and replace with links to OneDrive locations"
echo "NOTE: This implies you have already signed into OneDrive!"

# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"


onedrive_dir="$(/bin/ls "$HOME" | grep OneDrive)"
if [[ -d "$HOME/$onedrive_dir" ]]; then
  read -r -p "Symlink OneDrive folders (yes/no)? [n] " user_select
  user_select=${user_select:-"n"}
fi

if [[ "$user_select" =~ $yesexpr ]]; then
  if [[ -d "$HOME/.Desktop.old" ]] || [[ -d "$HOME/.Documents.old" ]]; then
    echo "WARNING: '.old' directories already exist"
    read -r -p "Continue and overwrite (yes/no)? [n] " overwrite
  fi
  # set default overwrite to "no"
  overwrite=${overwrite:-"n"}
  if [[ "$overwrite" =~ $yesexpr ]]; then
    echo "Overwriting current '.old' directories..."
    sudo mv -f "$HOME/Desktop" "$HOME/.Desktop.old"
    sudo mv -f "$HOME/Documents" "$HOME/.Documents.old"
    echo "Symlinking OneDrive folders..."
    sudo ln -Ffs "$HOME/$onedrive_dir/Desktop" "$HOME"
    sudo ln -Ffs "$HOME/$onedrive_dir/Documents" "$HOME"
    echo "If you are missing files or folders in Desktop or Documents after this, run:"
    echo "'mv -rf $HOME/.Desktop.old/* $HOME/Desktop'"
    echo "'mv -rf $HOME/.Documents.old/* $HOME/Documents'"
  fi
else
  echo "Retaining separate folders for user home ($HOME) and OneDrive."
fi
