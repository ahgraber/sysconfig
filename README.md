# zsh configuration

This repo is designed to quickly implement an intelligent standard zsh configuration.
In its default settings, it relies on [zsh4humans](https://github.com/romkatv/zsh4humans) with minor customization.
Alternatively, alter the install script to use `zshrc` and `zshenv` which relies on [zcomet](https://github.com/agkozak/zcomet) for more granular control of your zsh environment.  These files should be considered _alpha_.

## Quickstart

The following script will autoinstall the default configuration by:

- cloning this repo to `~/.zshconfig`
- installing [prerequisites](./scripts/prerequisites.sh) and required fonts
- symlinking [dotfiles](./dotfiles/) to home directory

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ahgraber/zshconfig/HEAD/install.sh)"
```

## Manual Configuration

### Set up git files

1. Set up your `.gitconfig`. Refer to [gitconfig](./dotfiles/gitconfig)

   ```sh
   git config --global user.name "Your Name"
   git config --global user.email "youremail@yourdomain.com"
   # https://leosiddle.com/posts/2020/07/git-config-pull-rebase-autostash/
   git config --global pull.rebase true
   git config --global rebase.autoStash true
   # git config --global credential.helper osxkeychain
   ```

> Git configuration (`~/.gitconfig` and `~/.gitattributes_global`) are copies (not symlinks) so they will not be synced if you update the git repository

### Modifying your setup

- `.zshrc` relies on [`zcomet`](https://github.com/agkozak/zcomet) for plugin management
- Other options are set in [`lib/*.zsh`](./lib/) files

#### References

- [zsh guide](https://zsh.sourceforge.io/Guide/zshguide.html)
- [completion utilities](https://zv.github.io/a-review-of-zsh-completion-utilities)
- [zcomet](https://github.com/agkozak/zcomet)
- [Benchmarks & conclusions](https://github.com/romkatv/zsh-bench)
  - [diy++ from benchmark](https://github.com/romkatv/zsh-bench/blob/master/configs/diy%2B%2B/skel/.zshrc)
  - [zcomet from benchmark](https://github.com/romkatv/zsh-bench/blob/master/configs/zcomet/skel/.zshrc)
- [zsh configuration](https://vermaden.wordpress.com/2021/09/19/ghost-in-the-shell-part-7-zsh-setup/)
- [completion configuration](https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh) and [blog](https://thevaluable.dev/zsh-completion-guide-examples/)
- [zstyle examples](https://gist.github.com/mattmc3/449430b6654aaab0ba7160e8efe8291b0)

## Hints & Tips

### aliases

Review `~/.aliases` for an understanding of available functionality and remapping (`bat` → `cat`; `exa` → `ls`)

> `~/.aliases` is synced to the git repo. For local configuration, use `~/.aliases.local`

### keybinds

|  icon   |    keybind    | description                                               |
| :-----: | :-----------: | :-------------------------------------------------------- | ------------------------ | --- |
| `^ + c` |  `ctrl + c`   | break/exit                                                |
|   `➡`   |     `tab`     | show available completions                                |
|  `➡➡`   |  `tab + tab`  | enter completion menu                                     |
| `⌥ + ←` | `opt + left`  | move the cursor one word left (including in completions)  |
| `⌥ + →` | `opt + right` | move the cursor one word right (including in completions) |
|  <!--   |    `⌥ + w`    | `opt + w`                                                 | undo last completed word | --> |
| `^ + w` |  `ctrl + w`   | delete prior word                                         |
| `^ + u` |  `ctrl + u`   | delete entire line                                        |
| `^ + _` |  `ctrl + -`   | undo                                                      |

> hint: run `bindkey` to see defaults

#### References

- [shortcuts](http://teohm.com/blog/shortcuts-to-move-faster-in-bash-command-line/)
- [cheatsheet](https://catonmat.net/bash-emacs-editing-mode-cheat-sheet)

### direnv

[direnv](https://direnv.net/) allows un/loading a unique set of environmental variables depending on the current directory.

#### [Session-based direnv use](https://direnv.net/man/direnv.1.html)

1. Navigate to working directory where `.envrc` exists that you would like to load
2. To allow access (both read and modify) to `.envrc`, run

   ```sh
   direnv allow .
   ```

#### [Whitelist directories for automatic `direnv` loading](https://direnv.net/man/direnv.toml.1.html)

"Specifying whitelist directives marks specific directory hierarchies or specific directories as “trusted” – direnv will evaluate any matching .envrc files regardless of whether they have been specifically allowed. This feature should be used with great care, as anyone with the ability to write files to that directory (including collaborators on VCS repositories) will be able to execute arbitrary code on your computer."

```sh
cat <<EOF > $HOME/.config/direnv/direnv.toml
[whitelist]
prefix = [ "$HOME/GitHub" ]) # whitelist `GitHub` dir
EOF
```
