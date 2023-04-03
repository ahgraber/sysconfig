#!/usr/bin/env zsh

# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091,SC2154

### >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${HOME}/mambaforge/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/mambaforge/etc/profile.d/conda.sh" ]; then
        . "${HOME}/mambaforge/etc/profile.d/conda.sh"  # commented out by conda initialize
        # CONDA_CHANGEPS1=false conda activate base
    else
        export PATH="${HOME}/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup
if [ -f "/Users/${USERNAME}/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/${USERNAME}/mambaforge/etc/profile.d/mamba.sh"  # commented out by conda initialize
fi
### <<< conda initialize <<<
