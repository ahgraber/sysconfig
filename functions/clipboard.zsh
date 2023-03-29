#!/usr/bin/env zsh

# ref: https://coderwall.com/p/a035gq/zsh-copy-paste-system-wide-for-os-x-like-in-emacs
# ref: https://gist.github.com/varenc/e4a22145c484771f254fa20982e2cd7f

pb-kill-line () {
  zle kill-line
  printf '%s' "$CUTBUFFER" | pbcopy
}

pb-kill-whole-line () {
  zle kill-whole-line
  printf '%s' "$CUTBUFFER" | pbcopy
}

pb-backward-kill-word () {
  zle backward-kill-word
  printf '%s' "$CUTBUFFER" | pbcopy
}

pb-kill-word () {
  zle kill-word
  printf '%s' "$CUTBUFFER" | pbcopy
}

pb-kill-buffer () {
  zle kill-buffer
  printf '%s' "$CUTBUFFER" | pbcopy
}

pb-copy-region-as-kill-deactivate-mark () {
  zle copy-region-as-kill
  zle set-mark-command -n -1
  printf '%s' "$CUTBUFFER" | pbcopy
}

pb-yank () {
  CUTBUFFER=$(pbpaste)
  zle yank
}

zle -N pb-kill-line
zle -N pb-kill-whole-line
zle -N pb-backward-kill-word
zle -N pb-kill-word
zle -N pb-kill-buffer
zle -N pb-copy-region-as-kill-deactivate-mark
zle -N pb-yank
