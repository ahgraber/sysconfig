#!/bin/bash

# bootstrap
export ZSH_CONFIG="${HOME}/.zshconfig"
[[ -d ${ZSH_CONFIG} ]] || git clone https://github.com/ahgraber/zshconfig.git ${ZSH_CONFIG}
cd ${ZSH_CONFIG}

echo "Installing prerequisites..."
. ./scripts/prerequisites.sh

echo "Prefilling local completions..."
. ./scripts/completions.sh

echo "Setting zsh as default shell.  This may require your user password"
zsh_path=$(which zsh)
[[ ! $(grep "${zsh_path}" /etc/shells) ]] && cat ${zsh_path} >> /etc/shells
chsh -s ${zsh_path}

echo "Initializing dotfiles..."
dotfiles=(aliases p10k.zsh zshrc zshenv)
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
