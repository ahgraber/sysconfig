#! /usr/bin/env bash

# set -o errexit
# set -o nounset
set -o pipefail
# set -o xtrace

# get parent dir if file or use dir if dir
_get_file_dir() {
  local fpath; fpath="${1:-$(pwd)}" || { echo "Error getting current directory"; exit 1; }
  if [[ -d "$fpath" ]]; then
    echo "$fpath"
  elif [[ -f "$fpath" ]]; then
    dirname "$fpath"
  else
    >&2 echo "Error: '$fpath' not detected as file or directory"
    return 1
  fi
}

# shellcheck disable=SC2120
_find_project() {
  # Traverse up the directory tree until a project folder is found
  local dir; dir="${1:-$(pwd)}" || { echo "Error getting current directory"; exit 1; }
  while [ "$dir" != "/" ]; do
    # Check for required project files and directories
    if [ -e "$dir/README.md" ] && [ -d "$dir/bin" ] && [ -d "$dir/dotfiles" ]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  # If no project folder is found, return an error message
  >&2 echo "Error: Could not identify project directory!"
  return 1
}

dir="$(_get_file_dir "${1:-"$(pwd)"}")"
cd "$dir" || exit 1
if [[ "$(git rev-parse --is-inside-work-tree)" == 'true' ]]; then
  git rev-parse --show-toplevel
else
  _find_project # implied cwd
fi
