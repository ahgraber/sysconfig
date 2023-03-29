#!/usr/bin/env zsh

# set FZF to onedark theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

# integrate `fd` with `fzf`
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# now, you can type `vim <Ctrl-T>` on your terminal to open fzf and search through the fd-results.
export FZF_DEFAULT_OPTS="--ansi"

### fzf-tab completions
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' show-group brief                    # show header only if multiple items / group
# set list-colors to enable filename colorizing
# shellcheck disable=SC2086,SC2296
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
# shellcheck disable=SC2016 # use single quotes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# keybinds
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'         # accept suggestion
zstyle ':fzf-tab:*' accept-line enter                   # accept and run
zstyle ':fzf-tab:*' continuous-trigger 'tab'              # accept and look for next completion
