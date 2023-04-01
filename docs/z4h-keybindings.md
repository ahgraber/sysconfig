# z4h - default keybindings

List current bindings with `bindkey`.  
List all available commands with `zle -al`.  
Test a key combination's translation with `ctrl + v; <keycombination>`.  
Create new key binding with `bindkey "<code>" <command>`.  

[A list of ASCII character code translations may be useful](https://redirect.cs.umbc.edu/portal/help/theory/ascii.txt)

## Default Keybindings

As of Mar 2023:

<!-- markdownlint-disable MD037 -->
| bindkey code | command | key combination |
| :---: | :--- | :---|
| `^@` | z4h-expand | `ctrl + space` |
| `^A` | beginning-of-line | `ctrl + a; cmd + left` |
| `^B` | backward-char | `ctrl + b` |
| `^D` | z4h-eof | `ctrl + d` |
| `^E` | end-of-line | `ctrl + e; cmd + right` |
| `^F` | forward-char | `ctrl + f` |
| `^G` | send-break | `ctrl + g` |
| `^H` | backward-delete-char | `ctrl + h` |
| `^I` | z4h-fzf-complete | `ctrl + i` |
| `^J` | accept-line | `ctrl + j` |
| `^K` | pb-kill-line | `ctrl + k` |
| `^L` | z4h-clear-screen-soft-bottom | `ctrl + l` |
| `^M` | accept-line | `ctrl + m` |
| `^N` | z4h-down-substring-local | `ctrl + n` |
| `^O` | accept-line-and-down-history | `ctrl + o` |
| `^P` | z4h-up-substring-local | `ctrl + p` |
| `^Q` | push-line | `ctrl + q` |
| `^R` | z4h-fzf-history | `ctrl + r` |
| `^S` | history-incremental-search-forward | `ctrl + s` |
| `^T` | transpose-chars | `ctrl + t` |
| `^U` | pb-kill-whole-line | `ctrl + u` |
| `^V` | quoted-insert | `ctrl + v` |
| `^W` | pb-backward-kill-word | `ctrl + w; alt + del` |
| `^Y` | pb-yank | `ctrl + y` |
| `^_` | undo | `ctrl + /` |
| `-"~"` | self-insert | `standard keys act as expected` |
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
| `^X^K` | pb-kill-buffer | `ctrl + x, ctrl + k` |
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
| `^[` | expand-history | `esc + space` |
| `^[!` | expand-history | `esc + !` |
| `^[\"` | quote-region | `esc + "` |
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
| `^[B` | z4h-backward-word | `esc + b; alt + left` |
| `^[C` | capitalize-word | `esc + c` |
| `^[D` | pb-kill-word | `esc + d; alt + right` |
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
| `^[W` | pb-copy-region-as-kill-deactivate-mark | `esc + w` |
| `^[[1;2A` | z4h-cd-up | `shift + up` |
| `^[[1;2B` | z4h-cd-down | `shift + down` |
| `^[[1;2C` | z4h-cd-forward | `shift + right` |
| `^[[1;2D` | z4h-cd-back | `shift + back` |
| `^[[1;3C` | z4h-forward-word | `alt + right` |
| `^[[1;3D` | z4h-backward-word | `alt + left` |
| `^[[1;3F` | z4h-end-of-buffer | `alt + fn+right` |
| `^[[1;3H` | z4h-beginning-of-buffer | `alt + fn+left` |
| `^[[1;5A` | z4h-up-prefix-global | `ctrl + up` |
| `^[[1;5B` | z4h-down-prefix-global | `ctrl + down` |
| `^[[1;5C` | end-of-line | `ctrl + right` |
| `^[[1;5D` | beginning-of-line | `ctrl + left` |
| `^[[1;5F` | z4h-end-of-buffer | `ctrl + fn + right` |
| `^[[1;5H` | z4h-beginning-of-buffer | `ctrl + fn + left` |
| `^[[1;6C` | z4h-forward-zword | `shift + ctrl + right` |
| `^[[1;6D` | z4h-backward-zword | `shift + ctrl + left` |
| `^[[1;9A` | ^[[1;3A | `alt + up` |
| `^[[1;9B` | ^[[1;3B | `alt + down` |
| `^[[1;9C` | ^[[1;3C | `cmd + alt + right` |
| `^[[1;9D` | ^[[1;3D | `cmd + alt + left` |
| `^[[1;9F` | ^[[1;3F | `cmd + alt + fn+right` |
| `^[[1;9H` | ^[[1;3H | `cmd + alt + fn+left` |
| `^[[1~` | ^[[H | `` |
| `^[[200~` | bracketed-paste | `` |
| `^[[3;3~` | z4h-kill-word | alt + delete` |
| `^[[3;5~` | kill-line | `ctrl + delete` |
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
| `^[b` | z4h-backward-word | `esc + b; alt + left` |
| `^[c` | capitalize-word | `esc + c` |
| `^[d` | z4h-kill-word | `esc + d; alt + right` |
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

## Using standard keyboard nav in different terminals

Goal: To avoid context-switching, try to have consistent keyboard nav across applications, including command line.

This means having standard behaviors like "Alt+Left" move to prior word, and "Cmd+Left" moving to beginning of line.
Since not all terminals will accept "Cmd" as a valid keybind, subsititue "Ctrl".

Simplistically, this looks something like:

| key combination | command |
| :---: | :--- |
| Home | 'beginning-of-line' |
| Cmd+Left | 'beginning-of-line' |
| Ctrl+Left | 'beginning-of-line' |
| End | 'end-of-line' |
| Cmd+Right | 'end-of-line' |
| Ctrl+Right | 'end-of-line' |
| Alt+Left | 'backward-word' |
| Alt+Right | 'forward-word' |
| Backspace | 'backward-delete-char' |
| Alt+Backspace | 'backward-kill-word' |
| Ctrl+Backspace | 'backward-kill-line' |
| Delete | 'delete-char' |
| Alt+Del | 'kill-word' |
| Ctrl+Del | 'kill-line' |

### Straightforward keybind behaviors

| bindkey code | command | key combination |
| :---: | :--- | :---|
| 'bindkey' '^[[H' | 'beginning-of-line'| Home |
| 'bindkey' '^[[1;5D' | 'beginning-of-line'| Ctrl+Left |
| 'bindkey' '^[[F' | 'end-of-line'| End |
| 'bindkey' '^[[1;5C' | 'end-of-line'| Ctrl+Right |
| 'bindkey' '^[[1;3D' | 'backward-word'| Alt+Left |
| 'bindkey' '^[[1;3C' | 'forward-word'| Alt+Right |
| 'bindkey' '^[[3~' | 'delete-char'| Delete |
| 'bindkey' '^[[3;3~' | 'kill-word'| Alt+Del |

### Hack application key shortcuts to remap desired combinations

Unfortunately, different terminals will send these intercept these keypresses differently -
particularly because `backspace` doesn't play well in key combinations.
Instead, we rely on standard zsh keybinds for these commands, and alter the keyboard shortcuts
_for each terminal application_ where needed to achieve the above effect.
([VSCode ref](https://code.visualstudio.com/docs/terminal/advanced#_keybinding-and-the-shell))

For instance, 'backward-kill-line' is `Ctrl+U`.  We want it to be `Ctrl+Backspace`.
For each terminal application, create a new shortcut that sends the `Ctrl+U` signal
when we press `Ctrl+Backspace`.

#### Remap remap Ctrl+Backspace to send Ctrl+U ('backward-kill-line') signal

| bindkey code | remap | remap representation |
| :---: | :--- | :---|
| MacOS Terminal | Ctrl+Backspace -> Ctrl+U | `\025` |
| iTerm | Ctrl+Backspace -> Ctrl+U | `0x15` |
| VSCode | Ctrl+Backspace -> Ctrl+U | `\u0015` |

#### Remap Ctrl+Delete to send Ctrl+K ('kill-line') signal

_NOTE:_ also map Shift+Ctrl+Backspace

| bindkey code | remap | remap representation |
| :---: | :--- | :---|
| MacOS Terminal | Ctrl+Delete -> Ctrl+K | `\013` |
| iTerm | Ctrl+Delete -> Ctrl+K | `0x0b` |
| VSCode | Ctrl+Delete -> Ctrl+K | `\u000b` |

#### Remap Alt+Backspace to send Ctrl+W ('backward-kill-word') signal

| bindkey code | remap | remap representation |
| :---: | :--- | :---|
| MacOS Terminal | Alt+Backspace -> Ctrl+W | `\027` |
| iTerm | Alt+Backspace -> Ctrl+W | `0x17` |
| VSCode | Alt+Backspace -> Ctrl+W | `\u0017` |

#### Remap Alt+Delete to send Alt+D ('kill-word') signal

_NOTE:_ also map Shift+Alt+Backspace!

| bindkey code | remap | remap representation |
| :---: | :--- | :---|
| MacOS Terminal | Alt+Delete -> Alt+D | `\033d` |
| iTerm | Alt+Delete -> Alt+D | `0x1b 0x64` |
| VSCode | Alt+Delete -> Alt+D | `\u001bd` |
