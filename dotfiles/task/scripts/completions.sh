#!/usr/bin/env bash
# shellcheck disable=SC2154 # ZSH_CONFIG used not assigned in this script

# bat
[[ -n $(command -v bat) ]] && \
    curl \
    -L https://raw.githubusercontent.com/sharkdp/bat/master/assets/completions/bat.zsh.in \
    -o "$ZSH_CONFIG/completions/_bat"

# docker
[[ -n $(command -v docker) ]] && \
    curl \
    -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
    -o "$ZSH_CONFIG/completions/_docker"

# docker-compose
[[ -n $(command -v docker-compose) ]] && \
    curl \
    -fsSL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
    -o "$ZSH_CONFIG/completions/_docker-compose"

# exa
[[ -n $(command -v exa) ]] && \
    curl \
    -fsSL https://raw.githubusercontent.com/ogham/exa/master/completions/zsh/_exa \
    -o "$ZSH_CONFIG/completions/_exa"

# fd
[[ -n $(command -v fd) ]] && \
    curl \
    -fsSL https://raw.githubusercontent.com/sharkdp/fd/master/contrib/completion/_fd \
    -o "$ZSH_CONFIG/completions/_fd"

# flux
if [[ -n $(command -v flux) ]]; then
    flux completion zsh > _flux
    mv _flux "$ZSH_CONFIG/completions/"
fi

# # helm
# if [[ -n $(command -v helm) ]]; then
#     helm completion zsh > _helm
#     mv _helm "$ZSH_CONFIG/completions/"
# fi

# # kubectl
# if [[ -n $(command -v kubectl) ]]; then
#     kubectl completion zsh > _kubectl
#     mv _kubectl "$ZSH_CONFIG/completions/"
# fi

# go-task
[[ -n $(command -v task) ]] && \
    curl \
    -fsSL https://raw.githubusercontent.com/go-task/task/master/completion/zsh/_task \
    -o "$ZSH_CONFIG/completions/_task"



# for cmd in bat exa fd flux task; do
#   # Homebrew ships broken completions for kubectl, so we use our own even
#   # if _comps[kubectl] is set.
#   #
#   # TODO: what about the rest of them in the list? Move them below?
#   [[ -v commands[$cmd] ]] && compdef -- -z4h-complete-$cmd $cmd
# done
