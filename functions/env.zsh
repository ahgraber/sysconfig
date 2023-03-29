#!/usr/bin/env zsh

env_load () {
  export "$(grep -v '^#' .env | xargs)"
}

# arch_brew () {
#   if [ "$(uname -p)" = "i386" ]; then
#     echo "Running 'brew' in x86 (Rosetta) mode"
#     eval "$(/usr/local/bin/brew shellenv)"
#     arch -x86_64 /usr/local/bin/brew "$@"
#   else
#     echo "Running 'brew' in arm64 (Native) mode"
#     eval "$(/opt/homebrew/bin/brew shellenv)"
#     arch -arm64 /opt/homebrew/bin/brew "$@"
#   fi
# }
