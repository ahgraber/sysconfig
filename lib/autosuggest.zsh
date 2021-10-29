# https://github.com/zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

zstyle 'autocompletion:*' menu select

zmodload zsh/complist
bindkey -M menuselect '^^[[C' autosuggest-accept  # ctrl + right
bindkey -M menuselect '^q' autosuggest-clear      # ctrl + q
