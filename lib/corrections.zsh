# manage corrections
# ref: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/correction.zsh

if [[ "$ENABLE_CORRECTION" == "true" ]]; then
  # echo "DEBUG: ENABLE_CORRECTION set to 'true' in .zshrc"
  alias cp='nocorrect cp'
  alias ebuild='nocorrect ebuild'
  alias gist='nocorrect gist'
  alias heroku='nocorrect heroku'
  alias hpodder='nocorrect hpodder'
  alias man='nocorrect man'
  alias mkdir='nocorrect mkdir'
  alias mv='nocorrect mv'
  alias mysql='nocorrect mysql'
  alias sudo='nocorrect sudo'
  alias su='nocorrect su'

  setopt correct                  # suggest corrections for commands
  setopt correct_all
  CORRECT_IGNORE="[_|.]*"
fi
