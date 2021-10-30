# ref: https://github.com/zsh-users/zsh-syntax-highlighting/blob/894127b221ab73847847bf7cf31eeb709bc16dc5/docs/highlighters.md

# limit maximum command length to highlight
ZSH_HIGHLIGHT_MAXLENGTH=512

# # Return if requirements are not found.
# zstyle ':syntax-highlighting' color 'yes'
# if ! zstyle -t ':syntax-highlighting' color; then
#     return 1
# fi

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Fix slowness of pastes with zsh-syntax-highlighting.zsh
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/295#issuecomment-214581607
# still required on zsh 5.8.0?
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
