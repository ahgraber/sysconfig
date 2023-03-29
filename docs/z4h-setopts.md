# z4h - default options

Enable option with `setopt <optionname>`.
Disable option with `unsetopt <optionname>` or `setopt no<optionname>`.

> optionnames are case- and underscore- insensitive:  "noautomenu", "no_auto_menu", and unsetopt "AUTOMENU" all do the same thing

## Default Options

| setopt | action |
| :---: | :--- |
| alwaystoend | when completing from the middle of a word, move the cursor to the end of the word |
| autocd | automatically change directory to entered path without requiring `cd` |
| noautomenu | (don't) show menu for completion |
| autopushd | auto add visited directories to stack |
| noautoremoveslash |(don't) remove trailing slash during completion |
| nobeep | (don't) beep on alert/error |
| nobgnice | (don't) run background jobs at lower priority |
| cbases | output hexadecimal numbers in C format: `0xFF` instead of `16#FF` |
| extendedglob | treat `#`, `~`, and `^` characters as part of patterns for filename generation, etc. |
| extendedhistory | Save each command's beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file |
| noflowcontrol | (don't) allow output flow control via start/stop characters (`^S`/`^Q`) |
| noglobalrcs | (don't) run startup files `/etc/zprofile`, `/etc/zshrc`, `/etc/zlogin`, and `/etc/zlogout` |
| globdots | do not require a leading `.` to be matched explicitly |
| histexpiredupsfirst | the oldest history event that has a duplicate will be truncated before losing a unique event from the list |
| histfindnodups | when searching history, do not display duplicates of a line previously found (even if the duplicates are not contiguous) |
| histignoredups | exclude command lines from the history list if they are duplicates of the previous (contiguous) event |
| histignorespace | exclude command lines from the history list if the first value is a space |
| histsavenodups | when writing history file, older commands with newer duplicates are omitted |
| histverify | if history expansion is used, expand before adding to editing buffer |
| interactive | this is an interactive shell |
| interactivecomments | allow comments even in interactive shells (i.e., in the command line) |
| nolisttypes | (don't)  |
| login | this is a login shell |
| promptsubst | *parameter expansion*, *command substitution*, and *arithmetic expansion* are performed in prompts |
| sharehistory | import new commands from history file and append lines to history as they are called |
| shinstdin | commands are read from standard input |
| typesetsilent | only show `typeset` commands/parameters show with `-m` option |
