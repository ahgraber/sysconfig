#!/usr/bin/env zsh

### Set options `man zshoptions`
### Ref: http://zsh.sourceforge.net/Doc/Release/Options.html.

#--- Global options ----------------------------------------------------------
setopt auto_cd                  # change directory to entered path
setopt no_beep                  # disable terminal alert sound
setopt no_bg_nice               # disable background task deprioritization
setopt c_bases                   # perform filename expansion on args to print,
                                # echo, and printf commands, (vs treating as literal strings)
setopt no_clobber               # force using `>!` to truncate / overwrite an existing file
setopt no_correct               # automatically suggest corrections for commands
setopt no_correct_all           # automatically suggest corrections for all arguments
setopt no_flow_control          # disable flow control (^S and ^Q) so that the terminal
                                # doesn't freeze when the output is too fast
setopt no_global_rcs            # disable sourcing of global zsh config files
setopt ignore_eof               # disable shell exit when the end-of-file character (^D)
                                # is entered at the beginning of a line
# setopt interactive              # interactive mode
setopt interactive_comments     # allow comments in interactive shells
# setopt login                    # when 'login' shell is started, zsh reads
                                # /etc/zprofile, ~/.zprofile, /etc/zlogin, and ~/.zlogin
setopt no_mail_warning          # don't print warning if mail has been accessed
# setopt path_dirs                # Perform path search even on command names with slashes
setopt monitor                  # enable job control in the shell, allowing jobs to be
                                # suspended, resumed, and killed using various built-in commands
setopt prompt_subst             # enable substitution of special character sequences in the shell prompt
setopt rcquotes                 # enable parsing of single-quoted strings in zshrc file,
                                # allowing the use of escaped characters and variable substitution
# setopt shin_stdin               # when running a shell script with the -c option,
#                                 # this option allows the script to read input from standard input
#                                 # instead of requiring input to be passed as arguments
setopt typeset_silent           # suppress the output of the typeset command
setopt zle                      # enable the Zsh Line Editor (ZLE), which provides
                                # advanced editing capabilities for command lines,
                                # including history searching, word completion, and keyboard shortcuts

#--- Directory stack/history -------------------------------------------------
setopt auto_pushd               # auto add visited directories to stack

#--- History -----------------------------------------------------------------
setopt extended_history         # save additional metadata in the history file,
                                # such as timestamps and exit status
setopt hist_append              # append commands to history
setopt hist_expire_dups_first   # remove duplicates before expiring other entries
setopt hist_fcntl_lock          # use file locking (useful for share_history)
setopt hist_find_no_dups        # don't show duplicates when reviewing history
setopt hist_ignore_dups         # do not save command that are duplicates of prior command
setopt hist_ignore_space        # do not save commands that start with space
setopt hist_save_no_dups        # remove duplicates before saving history
setopt hist_verify              # show history command in terminal before executing
setopt share_history            # share history between zsh instances

#--- Completions (some of this won't matter b/c of fzf and fzftab) -----------
setopt always_to_end            # when completing from the middle of a word,
                                # move the cursor to the end of the word
setopt auto_list                # automatically list choices on ambiguous completion
setopt auto_menu                # tab triggers autocompletion suggestions
setopt auto_param_slash         # if completed parameter is dir, add trailing slash
setopt no_auto_remove_slash     # do not remove trailing / from completions
setopt complete_aliases         # complete alisases
setopt complete_in_word         # allow completion from within a word/phrase
# setopt glob_complete            # complete after glob `*` instead of expanding it
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous
setopt list_rows_first          # lay out the completions horiz;
                                # 2nd match is to the right of the 1st, not under it (default)
setopt list_types               # use different colors and attributes to indicate
                                # file types in directory listings

#--- Expansion & Globbing ----------------------------------------------------
setopt bad_pattern              # if a pattern is badly formed, print error
setopt case_glob                # use case-sensitive globbing
setopt case_match               # use case-sensitive matching/regex matching
setopt extended_glob            # treat  the  `#', `~' and `^' characters as part of
                                # patterns for filename generation, etc
setopt glob_dots                # include dotfiles when globbing
setopt glob_star_short          # **/ matches only immediate subdirs, not recursive
setopt mark_dirs                # append trailing slash '/' to directory names resulting from globbing
