#!/bin/bash

# bootstrap
export ZSH_CONFIG="${HOME}/.zshconfig"
[[ -d ${ZSH_CONFIG} ]] || git clone https://github.com/ahgraber/zshconfig.git ${ZSH_CONFIG}
cd ${ZSH_CONFIG}

# install prerequisites
. ./scripts/prerequisites.sh

# set zsh as shell
zsh_path=$(which zsh)
[[ ! $(grep "${zsh_path}" /etc/shells) ]] && cat ${zsh_path} >> /etc/shells
chsh -s ${zsh_path}

# copy dotfiles, making backups if they exist
dotfiles=(aliases gitattributes_global gitconfig zshrc zshenv)
for file in ${dotfiles[@]}; do
  # if exists as link, relink
  [[ -L ${HOME}/.${file} ]] && ln -sf ${ZSH_CONFIG}/dotfiles/${file} ${HOME}/.${file}
  # if exists as file, back up
  [[ -f ${HOME}/.${file} ]] && mv ${HOME}/.${file} ${HOME}/.${file}.$(date +%Y%m%d)
done

exec zsh