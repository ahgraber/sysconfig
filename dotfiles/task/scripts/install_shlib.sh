# #!/usr/bin/env bash

# set -o errexit
# set -o nounset
# set -o pipefail

# HERE="$(dirname "$(readlink -f "$0")")"
# source "$HERE/clone_update.sh"
# clone_update -s https://github.com/client9/shlib.git -d /tmp/shlib

# SCRIPTS=(
#   license.sh
#   log.sh
#   echoerr.sh
#   assert.sh
#   is_command.sh
#   http_download.sh
#   github_release.sh
#   hash_md5.sh
#   hash_sha256.sh
#   uname_arch.sh
#   uname_arch_check.sh
#   uname_os.sh
#   uname_os_check.sh
#   untar.sh
#   mktmpdir.sh
# )

# # ensure destination directory exists
# DEST="/usr/local/bin/shlib"
# mkdir -p "$DEST"

# for s in "${SCRIPTS[@]}"; do
#   # copy file from git clone to destination and remove '.sh'
#   cp "/tmp/shlib/$s" "$DEST/${s%.sh}"
#   # ensure copied file is executable
#   chmod +x "$DEST/${s%.sh}"
# done;


# # # at /usr/local/bin, find subdirectories (-type d), excluding self (-mindepth 1)
# # # for each directory, run a bash command (chmod +x <path>/*)
# # # see also: https://www.shellcheck.net/wiki/SC2014
# # find /usr/local/bin -mindepth 1 -type d -exec bash -c 'chmod +x "$1/*"' _ {} \;

# #       - rm -f {{.SHLIB_EXEC}}
# #       # combine scripts in order, drop empty lines, and only use first shabang
# #       - |
# #         cat \
# #           license.sh \
# #           log.sh \
# #           echoerr.sh \
# #           assert.sh \
# #           is_command.sh \
# #           http_download.sh \
# #           github_release.sh \
# #           hash_md5.sh \
# #           hash_sha256.sh \
# #           uname_arch.sh \
# #           uname_arch_check.sh \
# #           uname_os.sh \
# #           uname_os_check.sh \
# #           untar.sh \
# #           mktmpdir.sh \
# #           license_end.sh \
# #         | grep -v "^$" \
# #         | sed '/^#!/d' \
# #         | sed -e $'1i\\\n#!/bin/sh\n' > {{.SHLIB_EXEC}}
# #       - chmod +x {{.SHLIB_EXEC}}
# #       - sudo chown root {{.SHLIB_EXEC}}
# #       # - grep -q "source shlib.sh" ~/.zshrc || echo "source shlib.sh" >> ~/.bashrc
# #       # - grep -q "source shlib.sh" ~/.zshrc || echo "source shlib.sh" >> ~/.zshrc
# #     vars:
# #       SHLIB_DEST: "{{.CODE_DIR}}/shlib"

# # # set all function files as executable


# # ### TODO: Add directories to PATH.
# # # example to check zshrc for line and add it if not present
# # grep -q "autoload -U bashcompinit" ~/.zshrc || echo "autoload -U bashcompinit" >> ~/.zshrc
# # ### TODO: This goes in .zshrc
# # for d in /usr/local/bin/*/; do
# #     PATH+=":$d"
# # done
