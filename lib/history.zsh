# History
# ref: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=250000
SAVEHIST=$HISTSIZE
setopt append_history           # Add commands to HISTFILE in order of execution
setopt extended_history         # Save timestamps & durations
setopt hist_expire_dups_first   # Delete duplicates first when HISTFILE size exceeds HISTSIZE
# setopt hist_find-no_dups        # When searching for prior entries, do nto display duplicates of previously found line (even non-contiguous)
setopt hist_ignore_all_dups     # If new command duplicates older, remove older from history (even non-contiguous)
# setopt hist_ignore_dups         # Do not enter new lines in history if duplicates
# setopt hist_ignore_space        # ignore commands that start with a space
setopt hist_no_functions        # do not include functions in history
setopt hist_verify              # Show command with history expansion to user before running it
