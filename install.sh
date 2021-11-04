#!/bin/bash
set -- "$(locale LC_MESSAGES)"
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4";

export ZSH_CONFIG="${HOME}/.zshconfig"

# check for ~/.zshconfig
if [[ -d "$ZSH_CONFIG" ]]; then
  # if dest_dir already contains .git directory, assume we've already installed there once
  if [[ -d "$ZSH_CONFIG/.git" ]]; then
    read -p "Update from source? (y/n)? [y] " git_select
    git_select=${git_select:-"y"}

    if [[ "$git_select" =~ $yesexpr ]]; then
      echo -e "\nUpdating (Will attempt to reapply any local changes)..."
      cd "$ZSH_CONFIG" # || exit
      echo -e "\nStashing local changes (stash)..."
      git stash
      echo -e "\nUpdating (pull --rebase)..."
      git checkout main && git pull --rebase origin
      echo -e "\nReverting local changes (stash pop)..."
      git stash pop
    fi
    unset git_select

  else
    read -p "~/.zshconfig already exists but is not a git repo.  Back up and overwrite (y/n)? [y] " overwrite_select
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

else
  echo "Cloning into $ZSH_CONFIG"
  git clone https://github.com/ahgraber/zshconfig.git "$ZSH_CONFIG"
fi
cd "$ZSH_CONFIG" # || exit

echo "Installing prerequisites..."
. ./scripts/prerequisites.sh

echo "Prefilling local completions..."
. ./scripts/completions.sh

echo "Setting zsh as default shell.  This may require your user password"
zsh_path=$(which zsh)
[[ ! $(grep "${zsh_path}" /etc/shells) ]] && cat "${zsh_path}" >> /etc/shells
chsh -s "${zsh_path}"

echo "Initializing dotfiles..."
dotfiles=(aliases p10k.zsh zshenv zshrc)
for file in "${dotfiles[@]}"; do
  # if exists as link, relink
  [[ -L "${HOME}/.${file}" ]] && unlink "${HOME}"/."${file}"
  # if exists as file, back up
  [[ -f "${HOME}/.${file}" ]] && mv "${HOME}/.${file}" "${HOME}/.${file}.$(date +%Y%m%d)"
  # make link
  ln -sf "${ZSH_CONFIG}"/dotfiles/"${file}" "${HOME}"/."${file}"
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

read -p "Disconnect from source repo? (y/n)? [n] " git_select
git_select=${git_select:-"n"}
if [[ "$git_select" =~ $yesexpr ]]; then
  rm -rf "$ZSH_CONFIG/.git"
fi
unset git_select

echo "Loading new configuration..."
exec zsh
