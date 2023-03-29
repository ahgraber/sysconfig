#!/usr/bin/env bash
# shellcheck disable=SC2034 # don't warn for unused variables

# shellcheck disable=SC2046
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4";

export ZSH_CONFIG="$HOME/.zshconfig"

# check for ~/.zshconfig
if [[ ! -d "$ZSH_CONFIG" ]] || [[ ! -d "$ZSH_CONFIG/.git" ]]; then
  if [[ -d "$ZSH_CONFIG" ]]; then
    # shellcheck disable=SC2088 # tilde does not expand in quotes
    read -r -p "~/.zshconfig already exists but is not a git repo.  Back up and overwrite (y/n)? [y] " overwrite_select
    overwrite_select=${overwrite_select:-"y"}

    if [[ "$overwrite_select" =~ $yesexpr ]]; then
      echo "Backing up..."
      mv "$ZSH_CONFIG" "$ZSH_CONFIG.$(date +%Y%m%d)"
    else
      echo "Exiting without configuring..."
      exit 0
    fi
    unset overwrite_select
  fi

  echo "Cloning into $ZSH_CONFIG"
  git clone https://github.com/ahgraber/zshconfig.git
  mv ./zshconfig "$ZSH_CONFIG"

else
  # if dest_dir already contains .git directory, assume we've already installed there once
  if [[ -d "$ZSH_CONFIG/.git" ]]; then
    read -r -p "Update from source? (y/n)? [y] " git_select
    git_select=${git_select:-"y"}

    if [[ "$git_select" =~ $yesexpr ]]; then
      echo -e "\nUpdating (Will attempt to reapply any local changes)..."
      cd "$ZSH_CONFIG" || exit
      echo -e "\nStashing local changes (stash)..."
      git stash
      echo -e "\nUpdating (pull --rebase)..."
      git checkout main && git pull --rebase origin
      echo -e "\nReverting local changes (stash pop)..."
      git stash pop
    fi
    unset git_select
  fi

fi
cd "$ZSH_CONFIG" || exit

echo "Installing prerequisites..."
. ./scripts/prerequisites.sh

### Note: if installed with Homebrew, completions should be detected automatically
# echo "Prefilling local completions..."
# . ./scripts/completions.sh

# echo "Setting zsh as default shell.  This may require your user password"
# zsh_path=$(which zsh)
# [[ ! $(grep "${zsh_path}" /etc/shells) ]] && cat "${zsh_path}" >> /etc/shells
# chsh -s "${zsh_path}"

echo "Initializing dotfiles..."
# dotfiles=(aliases p10k.zsh zshenv zshrc)
dotfiles=(aliases p10k.zsh z4henv z4hrc)
for file in "${dotfiles[@]}"; do
  # if exists as link, relink
  [[ -L "${HOME}/.${file/z4h/zsh}" ]] && unlink "${HOME}"/."${file/z4h/zsh}"
  # if exists as file, back up
  [[ -f "${HOME}/.${file/z4h/zsh}" ]] && mv "${HOME}/.${file/z4h/zsh}" "${HOME}/.${file/z4h/zsh}.$(date +%Y%m%d)"
  # make link
  ln -sf "${ZSH_CONFIG}"/dotfiles/"${file}" "${HOME}"/."${file/z4h/zsh}"
done

# copy git config files
if [[ -f "${HOME}/.gitconfig" ]]; then
  mv "${HOME}/.gitconfig" "${HOME}/.gitconfig.$(date +%Y%m%d)"
  cp "${ZSH_CONFIG}/dotfiles/gitconfig" "${HOME}/.gitconfig"
fi

if [[ -f "${HOME}/.gitattributes_global" ]]; then
  mv "${HOME}/.gitattributes_global" "${HOME}/.gitattributes_global.$(date +%Y%m%d)"
  cp "${ZSH_CONFIG}/dotfiles/gitattributes_global" "${HOME}/.gitattributes_global"
fi

read -r -p "Disconnect zshconfig from source repo? (y/n)? [y] " git_select
git_select=${git_select:-"y"}
if [[ "$git_select" =~ $yesexpr ]]; then
  rm -rf "$ZSH_CONFIG/.git"
fi
unset git_select

echo "Loading new configuration..."
exec zsh
