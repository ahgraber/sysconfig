#!/usr/bin/env zsh
# shellcheck disable=SC2034 # variable appears unused

# History
# ref: https://zsh.sourceforge.io/Guide/zshguide02.html#l17
# ref: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=250000
SAVEHIST=$HISTSIZE
setopt append_history           # Add commands to HISTFILE in order of execution
setopt extended_history         # Save timestamps & durations
setopt no_share_history         # Do not share history between shells until shell exit; new shells share history pool

# setopt hist_find_no_dups        # When searching for prior entries, do not display duplicates of previously found line (even non-contiguous)
setopt hist_ignore_dups         # Do not enter new lines in history if duplicates of immediately prior command
setopt hist_ignore_all_dups     # If new command duplicates older, remove older from history (even non-contiguous)
setopt hist_expire_dups_first   # Delete duplicates first when HISTFILE size exceeds HISTSIZE

setopt hist_ignore_space        # ignore commands that start with a space
setopt hist_no_functions        # do not include functions in history
setopt hist_reduce_blanks       # clean up extra whitespace in commands
setopt hist_verify              # Show command with history expansion to user before running it

### history-substring-search
bindkey '^[[A' history-substring-search-up          # up
bindkey '^[[B' history-substring-search-down        # down

HISTORY_SUBSTRING_SEARCH_FUZZY="true"               # perform a fuzzy search by words, matching in given order e.g. `ab c` will match `*ab*c*`
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE="true"       # equivalent to 'setopt hist_ignore_all_dups'
