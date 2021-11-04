#!/bin/bash
set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"

export ZSH_CONFIG="${HOME}/.zshconfig"

# if dest_dir already contains .git file, assume we've already installed there once
if [[ -d "$ZSH_CONFIG/.git" ]]; then
  read -p "Update from source? (y/n)? [y] " git_select
  git_select=${git_select:-"y"}

  if [[ "$git_select" =~ $yesexpr ]]; then
    echo "Updating...  Will attempt to reapply any local changes..."
    cd $ZSH_CONFIG
    git stash && git checkout main && git pull --rebase origin && git stash pop
  fi
  unset git_select

else
  if [[ -d "$ZSH_CONFIG" ]]; then
    read -p "~/.zshconfig already exists but is not a git repo.  Overwrite (y/n)? [y] " overwrite_select
    overwrite_select=${overwrite_select:-"y"}

    if [[ "$overwrite_select" =~ $yesexpr ]]; then
      rm -rf $ZSH_CONFIG
      echo "Cloning into $ZSH_CONFIG"
      git clone https://github.com/ahgraber/zshconfig.git
    else
      echo "Exiting without configuring..."
      exit 0
    fi
    unset overwrite_select

  else
    echo "Cloning into $ZSH_CONFIG"
    git clone https://github.com/ahgraber/zshconfig.git
  fi
fi
cd $ZSH_CONFIG

echo "Installing prerequisites..."
. ./scripts/prerequisites.sh

echo "Prefilling local completions..."
. ./scripts/completions.sh

echo "Setting zsh as default shell.  This may require your user password"
zsh_path=$(which zsh)
[[ ! $(grep "${zsh_path}" /etc/shells) ]] && cat ${zsh_path} >> /etc/shells
chsh -s ${zsh_path}

echo "Initializing dotfiles..."
dotfiles=(aliases p10k.zsh zshenv zshrc)
for file in ${dotfiles[@]}; do
  # if exists as link, relink
  [[ -L ${HOME}/.${file} ]] && unlink ${HOME}/.${file}
  # if exists as file, back up
  [[ -f ${HOME}/.${file} ]] && mv ${HOME}/.${file} ${HOME}/.${file}.$(date +%Y%m%d)
  # make link
  ln -sf ${ZSH_CONFIG}/dotfiles/${file} ${HOME}/.${file}
done

# copy git config files
[[ -f ${HOME}/.gitconfig ]] \
  && mv ${HOME}/.gitconfig ${HOME}/.gitconfig.$(date +%Y%m%d) \
  && cp ${ZSH_CONFIG}/dotfiles/gitconfig ${HOME}/.gitconfig

[[ -f ${HOME}/.gitattributes_global ]] \
  && mv ${HOME}/.gitattributes_global ${HOME}/.gitattributes_global.$(date +%Y%m%d) \
  && cp ${ZSH_CONFIG}/dotfiles/gitattributes_global ${HOME}/.gitattributes_global

echo "Loading new configuration..."
exec zsh

read -p "Disconnect from source repo? (y/n)? [n] " git_select
git_select=${git_select:-"n"}
if [[ "$git_select" =~ $yesexpr ]]; then
  rm -rf $ZSH_CONFIG/.git
fi
unset git_select
