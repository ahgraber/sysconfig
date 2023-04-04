#! /usr/bin/env bash

set -o errexit
# set -o nounset
set -o pipefail
# set -o xtrace

# shellcheck disable=SC2120
_find_project() {
  # Traverse up the directory tree until a project folder is found
  local dir; dir="$(pwd)"
  while [ "$dir" != "/" ]; do
    # Check for required project files and directories
    if [ -e "$dir/README.md" ] && [ -d "$dir/bin" ] && [ -d "$dir/dotfiles" ] && [ -d "$dir/src" ]; then
      echo "$dir"
      return 0
    fi
    dir=$(dirname "$dir")
  done
  # If no project folder is found, return an error message
  >&2 echo "Error: Could not identify project directory!"
  return 1
}

# get parent dir if file or use dir if dir
if [[ -d "$1" ]]; then
  dir="$1"
elif [[ -f "$1" ]]; then
  dir=$(dirname "$1")
else
  >&2 echo "Error: '$1' not detected as file or directory"
  exit 1
fi

cd "$dir"

if [[ "$(git rev-parse --is-inside-work-tree)" == 'true' ]]; then
  git rev-parse --show-toplevel
else
  _find_project
fi
