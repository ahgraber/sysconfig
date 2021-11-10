# z4h - default keybindings

List current bindings with `bindkey -l`.
List all available commands with `zle -al`.
Test a key combination's translation with `ctrl + v; <keycombination>`
Create new key binding with `bindkey "<code>" <command>`.

## Default Keybindings

As of Nov 2021:

| bindkey code | command | key combination |
| :---: | :--- | :---|
| `^@` | z4h-expand | `ctrl + space` |
| `^A` | beginning-of-line | `ctrl + a; cmd + left` |
| `^B` | backward-char | `ctrl + b` |
| `^D` | delete-char | `ctrl + d` |
| `^E` | end-of-line | `ctrl + e; cmd + right` |
| `^F` | forward-char | `ctrl + f` |
| `^G` | send-break | `ctrl + g` |
| `^H` | backward-delete-char | `ctrl + h` |
| `^I` | z4h-fzf-complete | `ctrl + i` |
| `^J` | accept-line | `ctrl + j` |
| `^K` | kill-line | `ctrl + k` |
| `^L` | z4h-clear-screen-soft-bottom | `ctrl + u` |
| `^M` | accept-line | `ctrl + m` |
| `^N` | z4h-down-substring-local | `ctrl + n` |
| `^O` | accept-line-and-down-history | `ctrl + o` |
| `^P` | z4h-up-substring-local | `ctrl + p` |
| `^Q` | push-line | `ctrl + q` |
| `^R` | z4h-fzf-history | `ctrl + r` |
| `^S` | history-incremental-search-forward | `ctrl + s` |
| `^T` | transpose-chars | `ctrl + t` |
| `^U` | kill-whole-line | `ctrl + u` |
| `^V` | quoted-insert | `ctrl + v` |
| `^W` | z4h-backward-kill-word | `ctrl + w; opt + del` |
| `^Y` | yank | `ctrl + y` |
| `^_` | undo | `ctrl + /` |
| ` -"~"` | self-insert | `standard keys act as expected` |
| `^?` | backward-delete-char | `backspace` |
| `\M-^@-"\M-A"` | self-insert | `` |
| `\M-B\M-.` | z4h-fzf-dir-history | `` |
| `\M-B\M-5` | z4h-autosuggest-accept | `` |
| `\M-B` | self-insert | `` |
| `\M-C\M-^B` | z4h-autosuggest-accept | `` |
| `\M-C\M-^N` | z4h-kill-word | `` |
| `\M-C\M-^S` | run-help | `` |
| `\M-C\M-^T` | kill-buffer | `` |
| `\M-C\M-^X` | z4h-stash-buffer | `` |
| `\M-C\M-7` | redo | `` |
| `\M-C\M-8` | z4h-stash-buffer | `` |
| `\M-C` | self-insert | `` |
| `\M-D\M-1` | z4h-backward-word | `` |
| `\M-D-"\M-J"` | self-insert | `` |
| `\M-K\M-^Y` | run-help | `` |
| `\M-K\M-^Z` | backward-kill-line | `` |
| `\M-K-"\M-a"` | self-insert | `` |
| `\M-b\M-^@\M-0` | z4h-fzf-dir-history | `` |
| `\M-b\M-^H\M-^B` | z4h-kill-word | `` |
| `\M-b\M-^H\M-^F` | kill-buffer | `` |
| `\M-b\M-^H\M-+` | z4h-backward-word | `` |
| `\M-b-"\M-n"` | self-insert | `` |
| `\M-o\M-#\M-?` | backward-kill-line | `` |
| `\M-o` | self-insert | `` |
| `^X^B` | vi-match-bracket | `ctrl + x, ctrl + b` |
| `^X^F` | vi-find-next-char | `ctrl + x, ctrl + f` |
| `^X^J` | vi-join | `ctrl + x, ctrl + j` |
| `^X^K` | kill-buffer | `ctrl + x, ctrl + k` |
| `^X^N` | infer-next-history | `ctrl + x, ctrl + n` |
| `^X^O` | overwrite-mode | `ctrl + x, ctrl + o` |
| `^X^R` | _read_comp | `ctrl + x, ctrl + r` |
| `^X^U` | undo | `ctrl + x, ctrl + u` |
| `^X^V` | vi-cmd-mode | `ctrl + x, ctrl + v` |
| `^X^X` | exchange-point-and-mark | `ctrl + x, ctrl + x` |
| `^X*` | expand-word | `ctrl + x, *` |
| `^X=` | what-cursor-position | `ctrl + x, =` |
| `^X?` | _complete_debug | `ctrl + x, ?` |
| `^XC` | _correct_filename | `ctrl + x, shift + c` |
| `^XG` | list-expand | `ctrl + x, shift + g` |
| `^Xa` | _expand_alias | `ctrl + x, a` |
| `^Xc` | _correct_word | `ctrl + x, c` |
| `^Xd` | _list_expansions | `ctrl + x, d` |
| `^Xe` | _expand_word | `ctrl + x, e` |
| `^Xg` | list-expand | `ctrl + x, g` |
| `^Xh` | _complete_help | `ctrl + x, h` |
| `^Xm` | _most_recent_file | `ctrl + x, m` |
| `^Xn` | _next_tags | `ctrl + x, n` |
| `^Xr` | history-incremental-search-backward | `ctrl + x, r` |
| `^Xs` | history-incremental-search-forward | `ctrl + x, s` |
| `^Xt` | _complete_tag | `ctrl + x, t` |
| `^Xu` | undo | `ctrl + x, u` |
| `^X~` | _bash_list-choices | `ctrl + x, ~` |
| `^[^D` | list-choices | `esc + ctrl + d` |
| `^[^G` | send-break | `esc + ctrl + g` |
| `^[^H` | z4h-backward-kill-word | `esc + ctrl + h` |
| `^[^I` | self-insert-unmeta | `esc + ctrl + i` |
| `^[^J` | self-insert-unmeta | `esc + ctrl + j` |
| `^[^L` | z4h-clear-screen-hard-bottom | `esc + ctrl + l` |
| `^[^M` | self-insert-unmeta | `esc + ctrl + m` |
| `^[^[[1~` | ^[[1;3H | `esc + fn + left` |
| `^[^[[3~` | ^[[3;3~ | `` |
| `^[^[[4~` | ^[[1;3F | `esc + fn + right` |
| `^[^[[7~` | ^[[1;3H | `` |
| `^[^[[8~` | ^[[1;3F | `` |
| `^[^[[A` | ^[[1;3A | `esc + up` |
| `^[^[[B` | ^[[1;3B | `esc + down` |
| `^[^[[C` | ^[[1;3C | `esc + right` |
| `^[^[[D` | ^[[1;3D | `esc + left` |
| `^[^_` | copy-prev-word | `` |
| `^[ ` | expand-history | `esc + space` |
| `^[!` | expand-history | `esc + !` |
| `^[\" quote-region` |  | `esc + "` |
| `^[\$` | spell-word | `esc + $` |
| `^['` | quote-line | `esc + '` |
| `^[,` | _history-complete-newer | `esc + ,` |
| `^[-` | neg-argument | `esc + -` |
| `^[.` | insert-last-word | `esc + .` |
| `^[/` | redo | `esc + /` |
| `^[0` | digit-argument | `esc + 0` |
| `^[1` | digit-argument | `esc + 1` |
| `^[2` | digit-argument | `esc + 2` |
| `^[3` | digit-argument | `esc + 3` |
| `^[4` | digit-argument | `esc + 4` |
| `^[5` | digit-argument | `esc + 5` |
| `^[6` | digit-argument | `esc + 6` |
| `^[7` | digit-argument | `esc + 7` |
| `^[8` | digit-argument | `esc + 8` |
| `^[9` | digit-argument | `esc + 9` |
| `^[<` | beginning-of-buffer-or-history | `esc + <` |
| `^[>` | end-of-buffer-or-history | `esc + >` |
| `^[?` | which-command | `esc + ?` |
| `^[A` | accept-and-hold | `esc + a` |
| `^[B` | z4h-backward-word | `esc + b; opt + left` |
| `^[C` | capitalize-word | `esc + c` |
| `^[D` | z4h-kill-word | `esc + d; opt + right` |
| `^[F` | z4h-forward-word | `esc + f` |
| `^[G` | get-line | `esc + g` |
| `^[H` | run-help | `esc + h` |
| `^[J` | kill-buffer | `esc + j` |
| `^[K` | backward-kill-line | `esc + k` |
| `^[L` | down-case-word | `esc + L` |
| `^[M` | z4h-autosuggest-accept | `esc + m` |
| `^[N` | history-search-forward | `esc + n` |
| `^[O` | z4h-stash-buffer | `esc + o` |
| `^[OA` | ^[[A | `up` |
| `^[OB` | ^[[B | `down` |
| `^[OC` | ^[[C | `right` |
| `^[OD` | ^[[D | `left` |
| `^[OF` | ^[[F | `up` |
| `^[OH` | ^[[H | `down` |
| `^[OM` | ^M | `right` |
| `^[OX` | = | `left` |
| `^[Oa` | ^[[1;5A | `ctrl + up` |
| `^[Ob` | ^[[1;5B | `ctrl + down` |
| `^[Oc` | ^[[1;5C | `ctrl + right` |
| `^[Od` | ^[[1;5D | `ctrl + left` |
| `^[Oj` | * | `` |
| `^[Ok` | + | `` |
| `^[Om` | - | `` |
| `^[Oo` | / | `` |
| `^[P` | history-search-backward | `esc + p` |
| `^[Q` | push-line | `esc + q` |
| `^[R` | z4h-fzf-dir-history | `esc + r` |
| `^[S` | spell-word | `esc + s` |
| `^[T` | transpose-words | `esc + t` |
| `^[U` | up-case-word | `esc + u` |
| `^[W` | copy-region-as-kill | `esc + w` |
| `^[[1;2A` | z4h-cd-up | `shift + up` |
| `^[[1;2B` | z4h-cd-down | `shift + down` |
| `^[[1;2C` | z4h-cd-forward | `shift + right` |
| `^[[1;2D` | z4h-cd-back | `shift + back` |
| `^[[1;3C` | z4h-forward-word | `opt + right` |
| `^[[1;3D` | z4h-backward-word | `opt + left` |
| `^[[1;3F` | z4h-end-of-buffer | `opt + fn+right` |
| `^[[1;3H` | z4h-beginning-of-buffer | `opt + fn+left` |
| `^[[1;5A` | z4h-up-prefix-global | `ctrl + up` |
| `^[[1;5B` | z4h-down-prefix-global | `ctrl + down` |
| `^[[1;5C` | z4h-forward-word | `ctrl + right` |
| `^[[1;5D` | z4h-backward-word | `ctrl + left` |
| `^[[1;5F` | z4h-end-of-buffer | `ctrl + fn + right` |
| `^[[1;5H` | z4h-beginning-of-buffer | `ctrl + fn + left` |
| `^[[1;6C` | z4h-forward-zword | `shift + ctrl + right` |
| `^[[1;6D` | z4h-backward-zword | `shift + ctrl + left` |
| `^[[1;9A` | ^[[1;3A | `opt + up` |
| `^[[1;9B` | ^[[1;3B | `opt + down` |
| `^[[1;9C` | ^[[1;3C | `cmd + opt + right` |
| `^[[1;9D` | ^[[1;3D | `cmd + opt + left` |
| `^[[1;9F` | ^[[1;3F | `cmd + opt + fn+right` |
| `^[[1;9H` | ^[[1;3H | `cmd + opt + fn+left` |
| `^[[1~` | ^[[H | `` |
| `^[[200~` | bracketed-paste | `` |
| `^[[3;3~` | z4h-kill-word | `` |
| `^[[3;5~` | z4h-kill-word | `ctrl + delete` |
| `^[[3;6~` | z4h-kill-zword | `` |
| `^[[3\^` | ^[[3;5~ | `` |
| `^[[3~` | delete-char | `backspace` |
| `^[[4~` | ^[[F | `` |
| `^[[5~` | z4h-do-nothing | `` |
| `^[[6~` | z4h-do-nothing | `` |
| `^[[7\$` | ^[[1;2H | `` |
| `^[[7\^` | ^[[1;5H | `` |
| `^[[7~` | ^[[H | `` |
| `^[[8\$` | ^[[1;2F | `` |
| `^[[8\^` | ^[[1;5F | `` |
| `^[[8~` | ^[[F | `` |
| `^[[A` | z4h-up-substring-local | `up` |
| `^[[B` | z4h-down-substring-local | `down` |
| `^[[C` | forward-char | `right` |
| `^[[D` | backward-char | `left` |
| `^[[F` | end-of-line | `fn + right` |
| `^[[H` | beginning-of-line | `fn + left` |
| `^[[a` | ^[[1;2A | `shift + up` |
| `^[[b` | ^[[1;2B | `shift + down` |
| `^[[c` | ^[[1;2C | `shift + left` |
| `^[[d` | ^[[1;2D | `shift + right` |
| `^[_` | insert-last-word | `esc + _` |
| `^[a` | accept-and-hold | `esc + a` |
| `^[b` | z4h-backward-word | `esc + b; opt + left` |
| `^[c` | capitalize-word | `esc + c` |
| `^[d` | z4h-kill-word | `esc + d; opt + right` |
| `^[f` | z4h-forward-word | `esc + f` |
| `^[g` | get-line | `esc + g` |
| `^[h` | run-help | `esc + h` |
| `^[j` | kill-buffer | `esc + j` |
| `^[k` | backward-kill-line | `esc + k` |
| `^[l` | down-case-word | `esc + L` |
| `^[m` | z4h-autosuggest-accept | `esc + m` |
| `^[n` | history-search-forward | `esc + n` |
| `^[o` | z4h-stash-buffer | `esc + o` |
| `^[p` | history-search-backward | `esc + p` |
| `^[q` | push-line | `esc + q` |
| `^[r` | z4h-fzf-dir-history | `esc + r` |
| `^[s` | spell-word | `esc + s` |
| `^[t` | transpose-words | `esc + t` |
| `^[u` | up-case-word | `esc + u` |
| `^[w` | copy-region-as-kill | `esc + w` |
| `^[x` | execute-named-cmd | `esc + x` |
| `^[y` | yank-pop | `esc + y` |
| `^[z` | execute-last-named-cmd | `esc + z` |
| `^[|` | vi-goto-column | `esc + |` |
| `^[~` | _bash_complete-word | `esc + ~` |
| `^[^?` | z4h-backward-kill-word | `esc + backspace` |
| `\M-p-"\M-^?"` | self-insert | `` |
