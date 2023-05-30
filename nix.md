# Nix-based System Configuration Definitions

## Prerequisites

The sole prerequisite for setup is `[Task](https://taskfile.dev/)`, which is used to define the bootstrap and install.
Therefore, we assume that the system is completely unconfigured and install Task from binary.

```sh
# install
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
# add autocompletions to shell
mv /usr/local/bin/_task /usr/local/share/zsh/site-functions/_task
# enable autocompletions
grep -q "autoload -U compinit" ~/.zshrc || echo "autoload -U compinit" >> ~/.zshrc
grep -q "autoload -U bashcompinit" ~/.zshrc || echo "autoload -U bashcompinit" >> ~/.zshrc
grep -q "compinit -i" ~/.zshrc || echo "compinit -i" >> ~/.zshrc
```

> ⚠️ As with any automated installation command, you should first verify the contents of the script!

## Installation

Once `task` is available, we can use it to bootstrap and install the nix configuration.

```sh
task bootstrap
```

This installs `nix`, `home-manager`,

## References

* <https://github.com/mfin/dotfiles>
* <https://xyno.space/post/nix-darwin-introduction>
* <https://www.softinio.com/post/moving-from-homebrew-to-nix-package-manager/>
* <https://ianthehenry.com/posts/how-to-learn-nix/switching-from-homebrew-to-nix/>
* <https://github.com/LnL7/nix-darwin>
* <https://github.com/hlissner/dotfiles>
* <https://myme.no/posts/2020-01-26-nixos-for-development.html>
* <https://www.tweag.io/blog/2020-08-12-poetry2nix/>

[nix package search([]](https://search.nixos.org/packages))
