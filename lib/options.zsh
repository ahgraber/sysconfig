# Set options `man zshoptions`
setopt auto_cd                  # change directory to entered path
setopt chase_dots               # do not follow symlinks when using '..'
setopt interactive_comments     # allow comments in interactive shells
setopt no_clobber               # Force using `>!` to truncate / overwrite an existing file
setopt no_mail_warning          # Don't print warning if mail has been accessed.
# setopt path_dirs                # Perform path search even on command names with slashes

# directory stack/history
setopt auto_pushd               # auto add visited directories to stack
setopt pushd_ignore_dups        # don't add duplicates to stack
setopt pushd_silent             # don't print the directory stack after pushd or popd

# Completion Options.
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt auto_list                # automatically list choices on ambiguous completion
# setopt auto_menu                # show completion menu on tab
setopt menu_complete            # on ambiguous completion, autoinsert first and rotate through with tab
setopt auto_param_slash         # if completed parameter is dir, add trailing slash
setopt auto_remove_slash        # When the last character from completion is /, remove in certain logical cases
setopt complete_in_word         # allow completion from within a word/phrase
setopt complete_aliases         # complete alisases
# setopt glob_complete            # complete after glob `*` isntead of expanding it
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous
setopt list_rows_first          # Lay out the completions horiz; the 2nd match is to the right of the 1s, not under it (default).

# Expansion & Globbing
setopt bad_pattern              # if a pattern is badly formed, print error
setopt glob_dots                # do not require a leading '.' to be matched explicitly
setopt extended_glob            # treat  the  `#', `~' and `^' characters as part of patterns for filename generation, etc.
setopt mark_dirs                # append trailing slash '/' to directory names resulting from globbing
setopt no_case_glob             # Use case-insensitive globbing
setopt no_case_match            # Use case-insensitive matching/regex matching
