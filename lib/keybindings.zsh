# bindkey keycode command
bindkey "^A" beginning-of-line                          # ctrl + a; cmd + left
bindkey "^B" backward-char                              # ctrl + b
bindkey "^D" delete-char-or-list                        # ctrl + d
bindkey "^E" end-of-line                                # ctrl + e; cmd + right
bindkey "^F" forward-char                               # ctrl + f
bindkey "^G" send-break                                 # ctrl + g
bindkey "^H" backward-delete-char                       # ctrl + h
bindkey "^I" complete-word                              # ctrl + i
bindkey "^J" accept-line                                # ctrl + j
bindkey "^K" kill-line                                  # ctrl + k
bindkey "^L" clear-screen                               # ctrl + u
bindkey "^M" accept-line                                # ctrl + m
bindkey "^N" down-line-or-history                       # ctrl + n
bindkey "^O" accept-line-and-down-history               # ctrl + o
bindkey "^P" up-line-or-history                         # ctrl + p
bindkey "^Q" push-line                                  # ctrl + q
bindkey "^R" history-incremental-search-backward        # ctrl + r
bindkey "^S" history-incremental-search-forward         # ctrl + s
bindkey "^T" transpose-chars                            # ctrl + t
bindkey "^U" kill-whole-line                            # ctrl + u
bindkey "^V" quoted-insert                              # ctrl + v
bindkey "^W" backward-kill-word                         # ctrl + w
bindkey "^X^K" kill-buffer                              # ctrl + x, ctrl + k
bindkey "^X^N" infer-next-history                       # ctrl + x, ctrl + n
bindkey "^X^O" overwrite-mode                           # ctrl + x, ctrl + o
bindkey "^X^U" undo                                     # ctrl + x, ctrl + u
bindkey "^X*" expand-word                               # ctrl + x, *
bindkey "^X=" what-cursor-position                      # ctrl + x, =
bindkey "^X?" _complete_debug                           # ctrl + x, ?
bindkey "^XC" _correct_filename                         # ctrl + x, shift + c
bindkey "^XG" list-expand                               # ctrl + x, shift + g
bindkey "^Xa" _expand_alias                             # ctrl + x, a
bindkey "^Xc" _correct_word                             # ctrl + x, c
bindkey "^Xd" _list_expansions                          # ctrl + x, d
bindkey "^Xe" _expand_word                              # ctrl + x, e
bindkey "^Xg" list-expand                               # ctrl + x, g
bindkey "^Xh" _complete_help                            # ctrl + x, h
bindkey "^Xm" _most_recent_file                         # ctrl + x, m
bindkey "^Xr" history-incremental-search-backward       # ctrl + x, r
bindkey "^Xs" history-incremental-search-forward        # ctrl + x, s
bindkey "^Xu" undo                                      # ctrl + x, u
bindkey "^[^D" list-choices                             # esc, ctrl + d
bindkey "^[^G" send-break                               # esc, ctrl + g
bindkey "^[^H" backward-kill-word                       # esc, ctrl + h
bindkey "^[^I" self-insert-unmeta                       # esc, ctrl + i
bindkey "^[^J" self-insert-unmeta                       # esc, ctrl + j
bindkey "^[^L" clear-screen                             # esc, ctrl + l
bindkey "^[^M" self-insert-unmeta                       # esc, ctrl + m
bindkey "^[^_" copy-prev-word                           # esc, ctrl + -
bindkey "^[ " expand-history                            # esc, space
bindkey "^[!" expand-history                            # esc, !
bindkey "^[\"" quote-region                             # esc, "
bindkey "^[\$" spell-word                               # esc, $
bindkey "^['" quote-line                                # esc, '
bindkey "^[," _history-complete-newer                   # esc, ,
bindkey "^[-" neg-argument                              # esc, -
bindkey "^[." insert-last-word                          # esc, .
bindkey "^[/" _history-complete-older                   # esc, /
bindkey "^[0" digit-argument                            # esc, 0
bindkey "^[1" digit-argument                            # esc, 1
bindkey "^[2" digit-argument                            # esc, 2
bindkey "^[3" digit-argument                            # esc, 3
bindkey "^[4" digit-argument                            # esc, 4
bindkey "^[5" digit-argument                            # esc, 5
bindkey "^[6" digit-argument                            # esc, 6
bindkey "^[7" digit-argument                            # esc, 7
bindkey "^[8" digit-argument                            # esc, 8
bindkey "^[9" digit-argument                            # esc, 9
bindkey "^[<" beginning-of-buffer-or-history            # esc, <
bindkey "^[>" end-of-buffer-or-history                  # esc, >
bindkey "^[?" which-command                             # esc, ?
bindkey "^[A" accept-and-hold                           # esc, a
bindkey "^[B" backward-word                             # esc, b
bindkey "^[C" capitalize-word                           # esc, c
bindkey "^[D" kill-word                                 # esc, d
bindkey "^[F" forward-word                              # esc, f
bindkey "^[G" get-line                                  # esc, t
bindkey "^[H" run-help                                  # esc, h
bindkey "^[L" down-case-word                            # esc, l
bindkey "^[N" history-search-forward                    # esc, n
bindkey "^[P" history-search-backward                   # esc, p
bindkey "^[Q" push-line                                 # esc, q
bindkey "^[S" spell-word                                # esc, s
bindkey "^[T" transpose-words                           # esc, t
bindkey "^[U" up-case-word                              # esc, u
bindkey "^[W" copy-region-as-kill                       # esc, w
bindkey "^[[200~" bracketed-paste
bindkey "^[[A" history-substring-search-up              # up
bindkey "^[[B" history-substring-search-down            # down
bindkey "^[[C" forward-char                             # right
bindkey "^[[D" backward-char                            # left
bindkey "^[_" insert-last-word                          # esc, _
bindkey "^[a" accept-and-hold                           # esc, a
bindkey "^[b" backward-word                             # esc, b; opt + left
bindkey "^[c" capitalize-word                           # esc, c
bindkey "^[d" kill-word                                 # esc, d
bindkey "^[f" forward-word                              # esc, f; opt + right
bindkey "^[g" get-line                                  # esc, g
bindkey "^[h" run-help                                  # esc, h
bindkey "^[l" down-case-word                            # esc, l
bindkey "^[n" history-search-forward                    # esc, n
bindkey "^[p" history-search-backward                   # esc, p
bindkey "^[q" push-line                                 # esc, q
bindkey "^[s" spell-word
bindkey "^[t" transpose-words
bindkey "^[u" up-case-word
bindkey "^[w" copy-region-as-kill
bindkey "^[x" execute-named-cmd
bindkey "^[y" yank-pop
bindkey "^[z" execute-last-named-cmd
bindkey "^[OA" up-line-or-history                       # up
bindkey "^[OB" down-line-or-history                     # down
bindkey "^[OC" forward-char                             # right
bindkey "^[OD" backward-char                            # left
bindkey "^[|" vi-goto-column
bindkey "^[~" _bash_complete-word
bindkey "^[^?" backward-kill-word
bindkey "^_" undo
bindkey " "-"~" self-insert
bindkey "^?" backward-delete-char
bindkey "\M-^@"-"\M-^?" self-insert

bindkey "^[[3~"   delete-char                           # delete
bindkey "^[[3;5~" kill-word                             # ctrl + delete
bindkey "^[[3;2~" kill-word                             # shift + delete
bindkey "^[[3;9~" kill-word                             # cmd + delete

bindkey -M menuselect '^^[[C' autosuggest-accept  # ctrl + right
bindkey -M menuselect '^q' autosuggest-clear      # ctrl + q
bindkey -M menuselect '^[[Z' reverse-menu-complete                  # shift-tab
bindkey -M menuselect '^o' accept-and-infer-next-history
